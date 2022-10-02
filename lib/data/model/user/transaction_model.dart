import 'package:notesgram/data/model/user/transaction_info_model.dart';
import 'package:notesgram/data/sources/remote/wrapper/model_factory.dart';

class TransactionModel implements ModelFactory {
  final TransactionInfoModel? info;
  final String? category;

  TransactionModel({
    this.info,
    this.category,
  });

  TransactionModel.fromJson(Map<String, dynamic> json)
      : info = (json['info'] as Map<String, dynamic>?) != null
            ? TransactionInfoModel.fromJson(
                json['info'] as Map<String, dynamic>)
            : null,
        category = json['category'] as String?;

  Map<String, dynamic> toJson() =>
      {'info': info?.toJson(), 'category': category};
}
