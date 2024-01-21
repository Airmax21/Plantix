import 'package:flutter/material.dart';
import 'package:plantix/components/CustomSurffixIcon.dart';

class DateTimeTextField extends StatefulWidget {
  final String label;
  final void Function(DateTime selectedDateTime)? onDateTimeSelected;
  final String? suffix;
  final String? hint;

  const DateTimeTextField({
    required this.label,
    this.onDateTimeSelected,
    this.suffix,
    this.hint,
  });

  @override
  _DateTimeTextFieldState createState() => _DateTimeTextFieldState();
}

class _DateTimeTextFieldState extends State<DateTimeTextField> {
  TextEditingController _dateTimeController = TextEditingController();
  DateTime _selectedDateTime = DateTime.now();

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDateTime) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        final DateTime combinedDateTime = DateTime(
          picked.year,
          picked.month,
          picked.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        setState(() {
          _selectedDateTime = combinedDateTime;
          _dateTimeController.text = _formatDateTime(_selectedDateTime);
        });

        // Panggil callback jika ada
        if (widget.onDateTimeSelected != null) {
          widget.onDateTimeSelected!(_selectedDateTime);
        }
      }
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return "${dateTime.toLocal()}".split('.')[0];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDateTime(context),
      child: AbsorbPointer(
        child: TextFormField(
          controller: _dateTimeController,
          decoration: InputDecoration(
            hintText: '${widget.hint}',
            labelText: '${widget.label}',
            suffixIcon: CustomSurffixIcon(svgIcon: '${widget.suffix}'),
          ),
        ),
      ),
    );
  }
}
