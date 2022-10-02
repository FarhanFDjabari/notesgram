import 'package:notesgram/data/model/user/challenge_transaction_model.dart';
import 'package:notesgram/data/sources/remote/wrapper/model_factory.dart';

class TransactionInfoModel implements ModelFactory {
  final int? id;
  final int? userId;
  final int? challengeId;
  final String? createdAt;
  final ChallengeTransactionModel? challenge;

  TransactionInfoModel({
    this.id,
    this.userId,
    this.challengeId,
    this.createdAt,
    this.challenge,
  });

  TransactionInfoModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        userId = json['userId'] as int?,
        challengeId = json['challengeId'] as int?,
        createdAt = json['createdAt'] as String?,
        challenge = (json['challenge'] as Map<String, dynamic>?) != null
            ? ChallengeTransactionModel.fromJson(
                json['challenge'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'challengeId': challengeId,
        'createdAt': createdAt,
        'challenge': challenge?.toJson()
      };
}
