import 'package:intl/intl.dart';
extension DateExtension on DateTime{

  String get toFormattedDate=>'$day/$month/$year';
  String get getDayName{
    DateFormat formatter = DateFormat('E');
    return formatter.format(this);
  }
}

