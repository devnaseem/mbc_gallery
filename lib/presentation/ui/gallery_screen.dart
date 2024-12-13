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

  final String _customDate = 'Custom Date';
  final String _allTime = 'All Time';
  DateTime? _fromDate;
  DateTime? _toDate;
  String _selectedFilter = 'All Time';

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

  double _getPanelMaxHeight() {
    double height = MediaQuery.of(context).size.height;
    return _selectedFilter == _customDate ? height * .35 : height * .26;
  }

  @override
  Widget build(BuildContext context) {
    final wellnessValue = ref
        .watch(galleryViewModelProvider.select((state) => state.galleryList));

    return SafeArea(
      child: Scaffold(
        backgroundColor:
            kIsWeb ? Colors.white : ColorConstants.primaryBrandColor,
        appBar: kIsWeb
            ? NavBarWidget(onBackPressed: () {
                dispatchBackPressedEvent();
              })
            : GalleryAppBarWidget(
                onFilterPressed: () {
                  // double height = MediaQuery.of(context).size.height;
                  isSmallScreen(context) || isMediumScreen(context)
                      ? _panelController.open()
                      : showDialog(
                          context: context,
                          builder: (context) {
                            String tempSelectedFilter = _selectedFilter;

                            // Instead of doing the padding calculation here, do it inside the StatefulBuilder
                            return StatefulBuilder(
                              builder: (BuildContext context,
                                  StateSetter setDialogState) {
                                // Compute the target height based on the current state of tempSelectedFilter
                                final bool isCustomDate =
                                    tempSelectedFilter == _customDate;
                                final double dialogHeight =
                                    isCustomDate ? 350 : 250;

                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        (MediaQuery.of(context).size.width -
                                                400) /
                                            2,
                                    vertical:
                                        (MediaQuery.of(context).size.height -
                                                dialogHeight) /
                                            2,
                                  ),
                                  child: Material(
                                    child: Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(24.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Date Filter',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall
                                                      ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xFF51534A),
                                                      ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/svg/retry.svg',
                                                      width: 20.0,
                                                      height: 20.0,
                                                    ),
                                                    SizedBox(width: 8),
                                                    Text(
                                                      'RESET',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium
                                                          ?.copyWith(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Color(
                                                                0xFF51534A),
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Container(
                                              height: 40,
                                              child: RadioListTile<String>(
                                                contentPadding: EdgeInsets.zero,
                                                title: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    _allTime,
                                                    style: GoogleFonts.openSans(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 18,
                                                      height: 1.4,
                                                      color: Color(0xFF51534A),
                                                    ),
                                                  ),
                                                ),
                                                value: _allTime,
                                                groupValue: tempSelectedFilter,
                                                activeColor: ColorConstants
                                                    .primaryBrandColor,
                                                fillColor: MaterialStateColor
                                                    .resolveWith((states) {
                                                  if (states.contains(
                                                      MaterialState.selected)) {
                                                    return ColorConstants
                                                        .primaryBrandColor;
                                                  }
                                                  return Colors.grey;
                                                }),
                                                onChanged: (value) {
                                                  setDialogState(() {
                                                    tempSelectedFilter = value!;
                                                  });
                                                },
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                              ),
                                            ),
                                            Container(
                                              height: 40,
                                              child: RadioListTile<String>(
                                                contentPadding: EdgeInsets.zero,
                                                title: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    _customDate,
                                                    style: GoogleFonts.openSans(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 18,
                                                      height: 1.4,
                                                      color: Color(0xFF51534A),
                                                    ),
                                                  ),
                                                ),
                                                value: _customDate,
                                                groupValue: tempSelectedFilter,
                                                activeColor: ColorConstants
                                                    .primaryBrandColor,
                                                fillColor: MaterialStateColor
                                                    .resolveWith((states) {
                                                  if (states.contains(
                                                      MaterialState.selected)) {
                                                    return ColorConstants
                                                        .primaryBrandColor;
                                                  }
                                                  return Colors.grey;
                                                }),
                                                onChanged: (value) {
                                                  setDialogState(() {
                                                    tempSelectedFilter = value!;
                                                  });
                                                },
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            if (tempSelectedFilter ==
                                                _customDate)
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: GestureDetector(
                                                        onTap: () async {
                                                          await _selectDate(
                                                              context,
                                                              isFromDate: true);
                                                          setDialogState(() {});
                                                        },
                                                        child: _buildDateBox(
                                                            context,
                                                            _fromDate,
                                                            'From'),
                                                      ),
                                                    ),
                                                    SizedBox(width: 8),
                                                    Expanded(
                                                      child: GestureDetector(
                                                        onTap: () async {
                                                          await _selectDate(
                                                              context,
                                                              isFromDate:
                                                                  false);
                                                          setDialogState(() {});
                                                        },
                                                        child: _buildDateBox(
                                                            context,
                                                            _toDate,
                                                            'To'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            Spacer(),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  height: 31,
                                                  width: 168,
                                                  child: RaisedButton(
                                                    color: Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      side: BorderSide(
                                                          color: Colors.black,
                                                          width: 0.50),
                                                    ),
                                                    onPressed: () {
                                                      // Update the main widget state based on dialog changes
                                                      // setState(() {
                                                      //   _selectedFilter =
                                                      //       tempSelectedFilter;
                                                      // });
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      'CANCEL',
                                                      style:
                                                          GoogleFonts.openSans(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 14,
                                                        color: ColorConstants
                                                            .primaryBrandColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 31,
                                                  width: 168,
                                                  child: RaisedButton(
                                                    color: ColorConstants
                                                        .primaryBrandColor,
                                                    onPressed: () {
                                                      // Update the main widget state based on dialog changes
                                                      setState(() {
                                                        _selectedFilter =
                                                            tempSelectedFilter;
                                                      });
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      'APPLY',
                                                      style:
                                                          GoogleFonts.openSans(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 14,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                },
              ),
        body: SlidingUpPanel(
          controller: _panelController,
          panel: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        child: Container(
                          width: 75,
                          height: 5,
                          color: ColorConstants.defaultTextColorLow,
                        ),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Date Filter',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF51534A),
                              ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/retry.svg',
                          width: 20.0,
                          height: 20.0,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'RESET',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF51534A),
                                    decoration: TextDecoration.underline,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 40,
                  child: RadioListTile<String>(
                    contentPadding: EdgeInsets.zero,
                    title: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _allTime,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          height: 1.4,
                          color: Color(0xFF51534A),
                        ),
                      ),
                    ),
                    value: _allTime,
                    groupValue: _selectedFilter,
                    activeColor: ColorConstants.primaryBrandColor,
                    fillColor: MaterialStateColor.resolveWith((states) {
                      if (states.contains(MaterialState.selected)) {
                        return ColorConstants
                            .primaryBrandColor; // Selected color
                      }
                      return Colors.grey; // Unselected color
                    }),
                    onChanged: (value) {
                      setState(() {
                        _selectedFilter = value!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
                Container(
                  height: 40,
                  child: RadioListTile<String>(
                    contentPadding: EdgeInsets.zero,
                    title: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _customDate,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          height: 1.4,
                          color: Color(0xFF51534A),
                        ),
                      ),
                    ),
                    value: _customDate,
                    groupValue: _selectedFilter,
                    activeColor: ColorConstants.primaryBrandColor,
                    fillColor: MaterialStateColor.resolveWith((states) {
                      if (states.contains(MaterialState.selected)) {
                        return ColorConstants
                            .primaryBrandColor; // Selected color
                      }
                      return Colors.grey; // Unselected color
                    }),
                    onChanged: (value) {
                      setState(() {
                        _selectedFilter = value!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
                SizedBox(height: 5),
                if (_selectedFilter == _customDate)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _selectDate(context, isFromDate: true),
                            child: _buildDateBox(context, _fromDate, 'From'),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: GestureDetector(
                            onTap: () =>
                                _selectDate(context, isFromDate: false),
                            child: _buildDateBox(context, _toDate, 'To'),
                          ),
                        ),
                      ],
                    ),
                  ),
                Spacer(),
                SizedBox(
                  height: 53,
                  width: double.infinity,
                  child: RaisedButton(
                    color: ColorConstants.primaryBrandColor,
                    onPressed: () {
                      _panelController.close();
                    },
                    child: Text(
                      'APPLY',
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          minHeight: 0,
          maxHeight: _getPanelMaxHeight(),
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
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
                        builder: (_) =>
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

  Widget _buildDateBox(BuildContext context, DateTime? date, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.openSans(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF51534A),
            height: 1.4,
          ),
        ),
        SizedBox(height: 4),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date != null ? DateFormat('yMMMd').format(date) : "",
                style: TextStyle(color: Colors.grey[700]),
              ),
              Icon(
                Icons.calendar_month,
                size: 18,
                color: Colors.grey[500],
              )
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context,
      {required bool isFromDate}) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: ColorConstants.primaryBrandColor,
              onPrimary: Colors.white,
              onSurface: ColorConstants.primaryBrandColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: ColorConstants.primaryBrandColor,
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
