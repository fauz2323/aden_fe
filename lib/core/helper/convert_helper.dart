import 'package:intl/intl.dart';

class ConvertHelper {
  static String convertToTitle(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }

  static String convertDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  static String convertPrice(num price) {
    final formatCurrency =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp. ');
    return formatCurrency.format(price);
  }
}
