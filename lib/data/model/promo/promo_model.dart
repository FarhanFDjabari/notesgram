import 'package:notesgram/data/sources/remote/wrapper/model_factory.dart';

class PromoModel implements ModelFactory {
  final int? id;
  final String? code;
  final int? discount;
  final String? endAt;
  final String? createdAt;
  final String? updatedAt;

  PromoModel({
    this.id,
    this.code,
    this.discount,
    this.endAt,
    this.createdAt,
    this.updatedAt,
  });

  PromoModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        code = json['code'] as String?,
        discount = json['discount'] as int?,
        endAt = json['endAt'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
        'discount': discount,
        'endAt': endAt,
        'createdAt': createdAt,
        'updatedAt': updatedAt
      };
}
