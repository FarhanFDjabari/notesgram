import 'package:get/get_utils/src/extensions/internacionalization.dart';

enum Weightenum {
  /// FontWeight 100.
  THIN,

  /// FontWeight 300.
  LIGHT,

  /// FontWeight 400.
  REGULAR,

  /// FontWeight 500.
  MEDIUM,

  /// FontWeight 600.
  SEMIBOLD,

  /// FontWeight 700.
  BOLD
}

enum SortValue { NEWEST, LATEST }

extension FilterSortValueExt on SortValue {
  static const Map<SortValue, String> keys = {
    SortValue.NEWEST: "newest",
    SortValue.LATEST: "latest"
  };

  static const Map<SortValue, String> values = {
    SortValue.NEWEST: "-created_at",
    SortValue.LATEST: "created_at"
  };

  String get key => keys[this]!;
  String get value => values[this]!;
}
