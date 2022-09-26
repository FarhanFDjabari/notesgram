import 'package:notesgram/data/model/promo/promo_model.dart';
import 'package:notesgram/data/sources/remote/wrapper/model_factory.dart';

class ValidatePromoModel implements ModelFactory {
  final bool? isValid;
  final PromoModel? promo;

  ValidatePromoModel({
    this.isValid,
    this.promo,
  });

  ValidatePromoModel.fromJson(Map<String, dynamic> json)
      : isValid = json['is_valid'] as bool?,
        promo = (json['promo'] as Map<String, dynamic>?) != null
            ? PromoModel.fromJson(json['promo'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'is_valid': isValid, 'promo': promo?.toJson()};
}
