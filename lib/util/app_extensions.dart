import 'package:intl/intl.dart';

extension DateTimeFormat on DateTime {
  String toEEEEMMMMdyyyy() {
    final DateFormat formatter = DateFormat('EEEE, MMMM d, yyyy');
    return formatter.format(this);
  }
}
