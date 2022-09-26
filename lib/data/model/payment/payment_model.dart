import 'package:notesgram/data/model/payment/withdrawal_model.dart';
import 'package:notesgram/data/sources/remote/wrapper/model_factory.dart';

class PaymentModel implements ModelFactory {
  final WithdrawalModel? withdrawal;
  final String? id;
  final int? userId;
  final int? amount;
  final String? bankCode;
  final int? accountNumber;
  final String? status;
  final int? adminFee;
  final String? createdAt;
  final String? updatedAt;

  PaymentModel({
    this.withdrawal,
    this.id,
    this.userId,
    this.amount,
    this.bankCode,
    this.accountNumber,
    this.status,
    this.adminFee,
    this.createdAt,
    this.updatedAt,
  });

  PaymentModel.fromJson(Map<String, dynamic> json)
      : withdrawal = (json['withdrawal'] as Map<String, dynamic>?) != null
            ? WithdrawalModel.fromJson(
                json['withdrawal'] as Map<String, dynamic>)
            : null,
        id = json['id'] as String?,
        userId = json['userId'] as int?,
        amount = json['amount'] as int?,
        bankCode = json['bank_code'] as String?,
        accountNumber = json['account_number'] as int?,
        status = json['status'] as String?,
        adminFee = json['admin_fee'] as int?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?;

  Map<String, dynamic> toJson() => {
        'withdrawal': withdrawal?.toJson(),
        'id': id,
        'userId': userId,
        'amount': amount,
        'bank_code': bankCode,
        'account_number': accountNumber,
        'status': status,
        'admin_fee': adminFee,
        'createdAt': createdAt,
        'updatedAt': updatedAt
      };
}
