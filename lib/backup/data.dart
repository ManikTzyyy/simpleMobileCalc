// ignore_for_file: unused_import

import 'package:flutter/material.dart';

int? kaliHd2 = 60;
int? kaliHd3 = 350;
int? kaliHd4 = 2500;


Future<int?> calculateResult(int? bonusValue, int? okValue, int? hd2aValue, int? hd3aValue, int? hd4aValue) async {
  if (bonusValue != null && okValue != null && hd2aValue !=null && hd3aValue !=null && hd4aValue !=null) {

    
    return bonusValue + okValue;
    

  }
  return null;
}
