import 'package:flutter/material.dart';
import 'package:mbc_common/mbc_common.dart';
import 'package:mbc_gallery/presentation/state/gallery_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mbc_gallery/presentation/ui/widgets/date_filter_selection_widget.dart';
import 'package:mbc_gallery/presentation/ui/widgets/raised_button.dart';

class DateFilterDialogue extends StatefulWidget {
  final Function(DateFilter, DateTime, DateTime) onApplyFilter;
  final DateFilter selectedDateFilter;
  final DateTime startDate;
  final DateTime endDate;

  const DateFilterDialogue({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.selectedDateFilter,
    required this.onApplyFilter,
  });

  @override
  State<DateFilterDialogue> createState() => _DateFilterDialogueState();
}

class _DateFilterDialogueState extends State<DateFilterDialogue> {
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
    final bool isCustomDate = _selectedFilter == DateFilter.customDate;
    final double dialogHeight = isCustomDate ? 350 : 250;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: (MediaQuery.of(context).size.width - 400) / 2,
        vertical: (MediaQuery.of(context).size.height - dialogHeight) / 2,
      ),
      child: Material(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 31,
                    width: 168,
                    child: RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side:
                            const BorderSide(color: Colors.black, width: 0.50),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'CANCEL',
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: ColorConstants.primaryBrandColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 31,
                    width: 168,
                    child: RaisedButton(
                      color: ColorConstants.primaryBrandColor,
                      onPressed: () {
                        widget.onApplyFilter(
                            _selectedFilter, _fromDate, _toDate);
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'APPLY',
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w700,
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
    );
  }

  void _resetFilters() {
    setState(() {
      _selectedFilter = DateFilter.allTime;
      _fromDate = widget.startDate;
      _toDate = widget.endDate;
    });
  }
}
