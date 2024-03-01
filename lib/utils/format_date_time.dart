import 'package:intl/intl.dart';

String formatTime(DateTime time) {
  return DateFormat.jm().format(time);
}

String formatDate(DateTime date) {
  return DateFormat('E, MMM d, yyyy').format(date);
}
