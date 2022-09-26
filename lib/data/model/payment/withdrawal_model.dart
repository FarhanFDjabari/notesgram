import 'package:notesgram/data/sources/remote/wrapper/model_factory.dart';

class WithdrawalModel implements ModelFactory {
  final Status? status;
  final int? amount;
  final String? timestamp;
  final String? recipientBank;
  final String? recipientAccount;
  final String? trxId;
  final String? partnerTrxId;

  WithdrawalModel({
    this.status,
    this.amount,
    this.timestamp,
    this.recipientBank,
    this.recipientAccount,
    this.trxId,
    this.partnerTrxId,
  });

  WithdrawalModel.fromJson(Map<String, dynamic> json)
      : status = (json['status'] as Map<String, dynamic>?) != null
            ? Status.fromJson(json['status'] as Map<String, dynamic>)
            : null,
        amount = json['amount'] as int?,
        timestamp = json['timestamp'] as String?,
        recipientBank = json['recipient_bank'] as String?,
        recipientAccount = json['recipient_account'] as String?,
        trxId = json['trx_id'] as String?,
        partnerTrxId = json['partner_trx_id'] as String?;

  Map<String, dynamic> toJson() => {
        'status': status?.toJson(),
        'amount': amount,
        'timestamp': timestamp,
        'recipient_bank': recipientBank,
        'recipient_account': recipientAccount,
        'trx_id': trxId,
        'partner_trx_id': partnerTrxId
      };
}

class Status {
  final String? code;
  final String? message;

  Status({
    this.code,
    this.message,
  });

  Status.fromJson(Map<String, dynamic> json)
      : code = json['code'] as String?,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {'code': code, 'message': message};
}
