import 'package:intl/intl.dart';

class Util {
  static getFormattedDate(DateTime date) {
    return DateFormat('EEE, MMM d, y').format(date);
  }
}
