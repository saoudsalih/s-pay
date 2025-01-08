import 'package:flutter/material.dart';
import 'package:indian_currency_to_word/indian_currency_to_word.dart';

class SHelperFunctions {
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static String converAmountToWords(double amount) {
    final converter = AmountToWords();
    return converter.convertAmountToWords(amount).replaceAll("  ", " ");
  }
}
