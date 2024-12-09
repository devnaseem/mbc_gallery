part of mbc_gallery;

class GalleryScreen extends ConsumerStatefulWidget {
  final String systemId;
  const GalleryScreen({super.key, required this.systemId});

  @override
  ConsumerState<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends ConsumerState<GalleryScreen> {
  final ScrollController _scrollController = ScrollController();

  void _openFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return const FractionallySizedBox(
          heightFactor: 0.5,
          child: DateFilterBottomSheet(),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(galleryViewModelProvider.notifier).getGalleryImages(widget.systemId);
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
        viewModel.getGalleryImages(widget.systemId,page: nextPage);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final wellnessValue = ref.watch(galleryViewModelProvider.select((state) => state.galleryList));

    return SafeArea(
      child: Scaffold(
        backgroundColor: kIsWeb ? Colors.white : ColorConstants.primaryBrandColor,
        appBar: kIsWeb
            ? NavBarWidget(onBackPressed: () {
                dispatchBackPressedEvent();
              })
            : GalleryAppBarWidget(
                onFilterPressed: () {
                  _openFilterSheet(context);
                  // dispatchBackPressedEvent();
                },
              ),
        body: wellnessValue.when(
          loading: () => const GalleryLoadingWidget(),
          data: (wellnessList) {
            final galleryList = GalleryListWidget(
              galleryPhotosList: wellnessList,
              scrollController: _scrollController,
              onTap: (String imageUrl) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FullScreenImageView(imagePath: imageUrl),
                  ),
                );
              },
            );
            if(kIsWeb && isDesktopScreen(context)) {
              return Row(
                children: [
                  Container(
                    color: ColorConstants.primaryBrandColor,
                    width: MediaQuery.of(context).size.width * 0.2,),
                  Expanded(child: galleryList)
                ],
              );
            }

            return galleryList;},
          error: (error, stackTrace) => Text(error.toString()),
        ),
      ),
    );
  }
}

class DateFilterBottomSheet extends StatefulWidget {
  const DateFilterBottomSheet({super.key});

  @override
  State<DateFilterBottomSheet> createState() => _DateFilterBottomSheetState();
}

class _DateFilterBottomSheetState extends State<DateFilterBottomSheet> {
  DateTime? _fromDate;
  DateTime? _toDate;
  String _selectedFilter = 'All time';

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return ColorConstants.primaryBrandColor; // Selected color
            }
            return ColorConstants.primaryBrandColor; // Unselected color
          }),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: ColorConstants.primaryBrandColor,
            // Apply button text color
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorConstants.primaryBrandColor,
            foregroundColor: Colors.white,
            // Apply button background color
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date Filter',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 16),
            RadioListTile<String>(
              title: Text('All time'),
              value: 'All time',
              groupValue: _selectedFilter,
              onChanged: (value) {
                setState(() {
                  _selectedFilter = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('Custom Date'),
              value: 'Custom Date',
              groupValue: _selectedFilter,
              onChanged: (value) {
                setState(() {
                  _selectedFilter = value!;
                });
              },
            ),
            if (_selectedFilter == 'Custom Date')
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _selectDate(context, isFromDate: true),
                        child: _buildDateBox(context, _fromDate, 'From Date'),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _selectDate(context, isFromDate: false),
                        child: _buildDateBox(context, _toDate, 'To Date'),
                      ),
                    ),
                  ],
                ),
              ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Apply'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateBox(BuildContext context, DateTime? date, String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        date != null ? DateFormat('yMMMd').format(date) : label,
        style: TextStyle(color: Colors.grey[700]),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, {required bool isFromDate}) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: ColorConstants.primaryBrandColor, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: ColorConstants.primaryBrandColor, // Body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: ColorConstants.primaryBrandColor, // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      setState(() {
        if (isFromDate) {
          _fromDate = pickedDate;
        } else {
          _toDate = pickedDate;
        }
      });
    }
  }
}
