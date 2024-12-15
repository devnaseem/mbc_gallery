import 'package:flutter/material.dart';
import 'package:mbc_common/mbc_common.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mbc_gallery/presentation/state/gallery_state.dart';
import 'package:mbc_gallery/presentation/ui/widgets/date_filter_selection_widget.dart';
import 'package:mbc_gallery/presentation/ui/widgets/raised_button.dart';

class DateFilterPanel extends StatefulWidget {
  final Function(DateFilter, DateTime, DateTime) onApplyFilter;
  final DateFilter selectedDateFilter;
  final DateTime startDate;
  final DateTime endDate;

  const DateFilterPanel({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.selectedDateFilter,
    required this.onApplyFilter,
  });

  @override
  State<DateFilterPanel> createState() => _DateFilterPanelState();
}

class _DateFilterPanelState extends State<DateFilterPanel> {
  late DateFilter _selectedFilter;
  late DateTime _fromDate;
  late DateTime _toDate;

  @override
  void initState() {
    super.initState();
    _selectedFilter = widget.selectedDateFilter;
    _fromDate = widget.startDate;
    _toDate = widget.endDate;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              child: Container(
                width: 75,
                height: 5,
                color: ColorConstants.defaultTextColorLow,
              ),
            ),
          ),
          const SizedBox(height: 8),
          DateFilterSelectionWidget(
            selectedFilter: _selectedFilter,
            fromDate: _fromDate,
            toDate: _toDate,
            onFilterChanged: (filter) {
              setState(() {
                _selectedFilter = filter;
              });
            },
            onFromDateChanged: (date) {
              setState(() {
                _fromDate = date;
              });
            },
            onToDateChanged: (date) {
              setState(() {
                _toDate = date;
              });
            },
            onResetPressed: _resetFilters,
            showReset: true,
          ),
          const Spacer(),
          SizedBox(
            height: 53,
            width: double.infinity,
            child: RaisedButton(
              color: ColorConstants.primaryBrandColor,
              onPressed: () {
                widget.onApplyFilter(_selectedFilter, _fromDate, _toDate);
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
    );
  }

  void _resetFilters() {
    setState(() {
      _selectedFilter = DateFilter.allTime;
      _fromDate = DateTime.now().subtract(Duration(days: 365));
      _toDate = DateTime.now();
    });
  }
}
