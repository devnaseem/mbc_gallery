part of mbc_gallery;

class GalleryScreen extends ConsumerStatefulWidget {
  final String systemId;
  const GalleryScreen({super.key, required this.systemId});

  @override
  ConsumerState<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends ConsumerState<GalleryScreen> {
  final ScrollController _scrollController = ScrollController();
  final PanelController _panelController = PanelController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref
            .read(galleryViewModelProvider.notifier)
            .getGalleryImages(widget.systemId);
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.extentAfter < 500) {
      final viewModel = ref.read(galleryViewModelProvider.notifier);
      final state = ref.read(galleryViewModelProvider);

      if (!state.isLoadingMore && state.shouldLoadMore) {
        int nextPage = state.currentPage + 1;
        viewModel.getGalleryImages(widget.systemId, page: nextPage);
      }
    }
  }

  double _getPanelMaxHeight(DateFilter selectedFilter) {
    double height = MediaQuery.of(context).size.height;
    return selectedFilter == DateFilter.customDate
        ? height * .35
        : height * .26;
  }

  @override
  Widget build(BuildContext context) {

    final wellnessValue = ref
        .watch(galleryViewModelProvider.select((state) => state.galleryList));

    final startDate =
        ref.watch(galleryViewModelProvider.select((state) => state.startDate));
    final endDate =
        ref.watch(galleryViewModelProvider.select((state) => state.endDate));

    final selectedFilter = ref.watch(
        galleryViewModelProvider.select((state) => state.selectedFilter));

    final filterPressedListener = () {
      (isSmallScreen(context) || isMediumScreen(context)) && !kIsWeb
          ? _panelController.open()
          : showDialog(
              context: context,
              builder: (context) {
                return DateFilterDialogue(
                  startDate: startDate!,
                  endDate: endDate!,
                  selectedDateFilter: selectedFilter,
                  onApplyFilter: (DateFilter filter, DateTime startDate, DateTime endDate) {
                      ref.read(galleryViewModelProvider.notifier)
                         .updateGallerySettings(widget.systemId, filter, startDate, endDate,);
                  },
                );
              },
            );
    };
    return SafeArea(
      child: Scaffold(
        backgroundColor: kIsWeb ? Colors.white : ColorConstants.primaryBrandColor,
        appBar: kIsWeb
            ? NavBarWidget(
                onFilterPressed: filterPressedListener,
                onBackPressed: () {
                  dispatchBackPressedEvent();
                })
            : GalleryAppBarWidget(onFilterPressed: filterPressedListener),
        body: SlidingUpPanel(
          controller: _panelController,
          panel: DateFilterPanel(
            startDate: startDate!,
            endDate: endDate!,
            selectedDateFilter: selectedFilter,
            onApplyFilter: (DateFilter filter, DateTime startDate, DateTime endDate) {
              _panelController.close();
              ref.read(galleryViewModelProvider.notifier)
                  .updateGallerySettings(widget.systemId, filter, startDate, endDate,);
            },
          ),
          minHeight: 0,
          maxHeight: _getPanelMaxHeight(selectedFilter),
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          body: wellnessValue.when(
              loading: () => const GalleryLoadingWidget(),
              data: (wellnessList) {
                final galleryList = GalleryListWidget(
                  galleryPhotosList: wellnessList,
                  scrollController: _scrollController,
                  onTap: (String imageUrl) {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (_) =>
                            FullScreenImageView(imagePath: imageUrl),
                      ),
                    );
                  },
                );
                if (kIsWeb && isDesktopScreen(context)) {
                  return Row(
                    children: [
                      Container(
                        color: ColorConstants.primaryBrandColor,
                        width: MediaQuery.of(context).size.width * 0.2,
                      ),
                      Expanded(child: galleryList),
                    ],
                  );
                }
                return galleryList;
              },
              error: (error, stackTrace) => Text(error.toString())),
        ),
      ),
    );
  }
}
