import 'package:intl/intl.dart';

String formatDateRange(String dateRange) {
  final dates = dateRange.split(' to ');
  final startDate = DateTime.parse(dates[0]);
  final endDate = DateTime.parse(dates[1]);

  final formattedStartDate = DateFormat('MMMM d, yyyy').format(startDate);
  final formattedEndDate = DateFormat('MMMM d, yyyy').format(endDate);

  return '$formattedStartDate to $formattedEndDate';
}