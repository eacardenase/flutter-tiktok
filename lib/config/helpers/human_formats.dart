import 'package:intl/intl.dart';

class HumanFormats {
  HumanFormats._();

  static String humanReadableNumber(int number) {
    final formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
    ).format(number);

    return formattedNumber;
  }
}
