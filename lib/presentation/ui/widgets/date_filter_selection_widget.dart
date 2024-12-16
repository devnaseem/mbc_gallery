import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mbc_common/mbc_common.dart';
import 'package:mbc_gallery/presentation/state/gallery_state.dart';

class DateFilterSelectionWidget extends StatelessWidget {
  final DateFilter selectedFilter;
  final DateTime fromDate;
  final DateTime toDate;
  final ValueChanged<DateFilter> onFilterChanged;
  final ValueChanged<DateTime> onFromDateChanged;
  final ValueChanged<DateTime> onToDateChanged;
  final VoidCallback onResetPressed;
  final bool showReset;

  const DateFilterSelectionWidget({
    Key? key,
    required this.selectedFilter,
    required this.fromDate,
    required this.toDate,
    required this.onFilterChanged,
    required this.onFromDateChanged,
    required this.onToDateChanged,
    required this.onResetPressed,
    this.showReset = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(context),
        _buildRadioTile(
          context,
          label: DateFilter.allTime.value!,
          value: DateFilter.allTime,
        ),
        _buildRadioTile(
          context,
          label: DateFilter.customDate.value!,
          value: DateFilter.customDate,
        ),
        const SizedBox(height: 5),
        if (selectedFilter == DateFilter.customDate)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      final picked = await _selectDate(context, fromDate);
                      if (picked != null) onFromDateChanged(picked);
                    },
                    child: DateBox(date: fromDate, label: 'From'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      final picked = await _selectDate(context, toDate,
                          firstDate: fromDate);
                      if (picked != null) onToDateChanged(picked);
                    },
                    child: DateBox(date: toDate, label: 'To'),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Date Filter',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF51534A),
              ),
        ),
        if (showReset)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                'packages/mbc_gallery/package_assets/retry.svg',
                width: 20.0,
                height: 20.0,
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: onResetPressed,
                child: Text(
                  'RESET',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF51534A),
                        decoration: TextDecoration.underline,
                      ),
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildRadioTile(BuildContext context,
      {required String label, required DateFilter value}) {
    return Container(
      height: 40,
      child: RadioListTile<String>(
        contentPadding: EdgeInsets.zero,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              height: 1.4,
              color: const Color(0xFF51534A),
            ),
          ),
        ),
        value: value.value!,
        groupValue: selectedFilter.value,
        activeColor: ColorConstants.primaryBrandColor,
        fillColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return ColorConstants.primaryBrandColor;
          }
          return Colors.grey;
        }),
        onChanged: (val) {
          if (val != null) {
            onFilterChanged(DateFilter.fromString(val));
          }
        },
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }

  Future<DateTime?> _selectDate(BuildContext context, DateTime initialDate,
      {DateTime? firstDate}) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate ?? DateTime(2000),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
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
    return pickedDate;
  }
}

class DateBox extends StatelessWidget {
  final DateTime date;
  final String label;

  const DateBox({Key? key, required this.date, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateString = DateFormat('yMMMd').format(date);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.openSans(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF51534A),
            height: 1.4,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dateString,
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
}
