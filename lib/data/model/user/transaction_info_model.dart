import 'package:notesgram/data/model/note/note_model.dart';
import 'package:notesgram/data/model/user/challenge_transaction_model.dart';
import 'package:notesgram/data/sources/remote/wrapper/model_factory.dart';

class TransactionInfoModel implements ModelFactory {
  final String? id;
  final int? userId;
  final int? noteId;
  final int? challengeId;
  final int? amount;
  final String? bankCode;
  final String? paymentMethod;
  final int? accountNumber;
  final String? status;
  final int? adminFee;
  final String? createdAt;
  final ChallengeTransactionModel? challenge;
  final NoteModel? note;

  TransactionInfoModel({
    this.id,
    this.userId,
    this.noteId,
    this.challengeId,
    this.createdAt,
    this.challenge,
    this.amount,
    this.accountNumber,
    this.bankCode,
    this.paymentMethod,
    this.adminFee,
    this.status,
    this.note,
  });

  TransactionInfoModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        userId = json['userId'] as int?,
        noteId = json['noteId'] as int?,
        challengeId = json['challengeId'] as int?,
        createdAt = json['createdAt'] as String?,
        amount = json['amount'] as int?,
        accountNumber = json['account_number'] as int?,
        status = json['status'] as String?,
        adminFee = json['admin_fee'] as int?,
        bankCode = json['bank_code'] as String?,
        paymentMethod = json['payment_method'] as String?,
        challenge = (json['challenge'] as Map<String, dynamic>?) != null
            ? ChallengeTransactionModel.fromJson(
                json['challenge'] as Map<String, dynamic>)
            : null,
        note = (json['note'] as Map<String, dynamic>?) != null
            ? NoteModel.fromJson(json['note'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'noteId': noteId,
        'challengeId': challengeId,
        'createdAt': createdAt,
        'challenge': challenge?.toJson(),
        'note': note?.toJson(),
        'amount': amount,
        'account_number': accountNumber,
        'status': status,
        'bank_code': bankCode,
        'payment_method': paymentMethod,
        'admin_fee': adminFee,
      };
}
