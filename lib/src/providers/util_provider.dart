import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UtilProvider with ChangeNotifier {
  DateTime? _initialDate = DateTime.now();
  DateTime? get initialDate => _initialDate;
  set initialDate(DateTime? val) {
    _initialDate = val;
    notifyListeners();
  }

  String? _selectedDate;
  String? get selectedDate => _selectedDate;
  set selectedDate(String? val) {
    _selectedDate = val;
    notifyListeners();
  }
  File? _file;
  File? get file => _file;
  set file(File? val) {
    _file = val;
    notifyListeners();
  }

  Future<void> pickDate(BuildContext context) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate!,

      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    selectedDate = DateFormat('MM-dd-yyyy').format(newDate!);

  }
}
