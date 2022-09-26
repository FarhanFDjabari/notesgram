import 'package:notesgram/data/sources/remote/wrapper/model_factory.dart';

class PurchaseModel implements ModelFactory {
  final int? userId;

  PurchaseModel({
    this.userId,
  });

  PurchaseModel.fromJson(Map<String, dynamic> json)
      : userId = json['userId'] as int?;

  Map<String, dynamic> toJson() => {'userId': userId};
}
