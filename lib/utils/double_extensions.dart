import 'package:intl/intl.dart';

///extension on double to format double to string
///with a maximum of 2 decimal places
///with a minimum of 0 decimal places
extension FormatDouble on double {
  String formatDouble() {
    NumberFormat formatter = NumberFormat();
    formatter.minimumFractionDigits = 0;
    formatter.maximumFractionDigits = 2;
    final result = formatter.format(this);
    return result;
  }
}

///create a extension on double to format with the minimum decimals possible
extension DoubleExtension on double {
  String format() {
    if (this == 0) {
      return '';
    } else if (this < 1) {
      return fraction();
    } else if ((this * 10) % 10 == 0) {
      return toStringAsFixed(0);
    } else {
      return toStringAsFixed(1);
    }
  }

  String fraction() {
    if (this < 1) {
      if (this == 0.5) {
        return '1/2';
      } else if (this == 0.25) {
        return '1/4';
      } else if (this == 0.125) {
        return '1/8';
      } else if (this == 0.0625) {
        return '1/16';
      } else if (this == 0.03125) {
        return '1/32';
      } else {
        return toStringAsFixed(2);
      }
    } else {
      return toStringAsFixed(2);
    }
  }
}
