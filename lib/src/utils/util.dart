import 'package:intl/intl.dart';

class Util {
  static getFormattedDate(DateTime date) {
    return DateFormat('EEEE, MMM d, y').format(date);
  }
}
