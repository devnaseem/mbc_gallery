import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mbc_common/mbc_common.dart';
import 'raised_button.dart';

class DateFilterDialog extends StatefulWidget {
  @override
  _DateFilterDialogState createState() => _DateFilterDialogState();
}

class _DateFilterDialogState extends State<DateFilterDialog> {
  String _selectedOption = 'All Time';

  void _resetSelection() {
    setState(() {
      _selectedOption = 'All Time';
    });
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

  Widget _buildDateBox(BuildContext context, DateTime? date, String label) {
    return Scaffold(
      body: Column(
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
      ),
    );
  }

  final String _customDate = 'Custom Date';
  final String _allTime = 'All Time';
  DateTime? _fromDate;
  DateTime? _toDate;
  String _selectedFilter = 'All Time';

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Date Filter',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Color(0xFF51534A),
              ),
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
                return ColorConstants.primaryBrandColor; // Selected color
              }
              return Colors.grey; // Unselected color
            }),
            onChanged: (value) {
              setState(() {
                _selectedFilter = value!;
              });
            },
            controlAffinity: ListTileControlAffinity.trailing,
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
                return ColorConstants.primaryBrandColor; // Selected color
              }
              return Colors.grey; // Unselected color
            }),
            onChanged: (value) {
              setState(() {
                _selectedFilter = value!;
              });
            },
            controlAffinity: ListTileControlAffinity.trailing,
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
                    onTap: () => _selectDate(context, isFromDate: false),
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
              // _panelController.close();
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
    );
  }
}

void showDateFilterDialog(BuildContext context) {
  showDialog<String>(
    context: context,
    builder: (context) => DateFilterDialog(),
  ).then((value) {
    if (value != null) {
      // Handle the returned selection
      print('Selected: $value');
    }
  });
}
