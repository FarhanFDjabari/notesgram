class MoneyFormat {
  static String parse(dynamic price) {
    if (price.runtimeType != String) {
      price = price.toString();
    }
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), '.');
      return value;
    }
    return price;
  }
}
