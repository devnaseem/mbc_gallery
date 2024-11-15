part of mbc_gallery;

class GalleryScreen extends ConsumerStatefulWidget {
  final String systemId;
  const GalleryScreen({super.key, required this.systemId});

  @override
  ConsumerState<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends ConsumerState<GalleryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
          (_) {
        ref
            .read(galleryViewModelProvider.notifier)
            .getGalleryImages();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final wellnessValue = ref
        .watch(galleryViewModelProvider.select((state) => state.galleryList));

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: kIsWeb? NavBarWidget(
            onBackPressed : (){
              html.window.dispatchEvent(html.CustomEvent('back_pressed'));
            }
        ):  AppBar(
          backgroundColor: ColorConstants.primaryBrandColor,
          title: const  Text("Gallery", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),),
        ),
        body:
        wellnessValue.when(
          loading: () => const GalleryLoadingWidget(),
          data: (wellnessList) => GalleryListWidget(wellnessList: wellnessList, onTap: (){
           // GoRouter.of(context).go("/wellnessDetails");
          },),
          error: (error, stackTrace) => Text(error.toString()),
        ),
      ),
    );
  }
}
