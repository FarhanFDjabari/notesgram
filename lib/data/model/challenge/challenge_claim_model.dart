import 'package:notesgram/data/model/challenge/challenge_item_model.dart';

class ChallengeClaimModel {
  final int? id;
  final int? userId;
  final int? challengeId;
  final String? createdAt;
  final ChallengeItemModel? challenge;

  ChallengeClaimModel({
    this.id,
    this.userId,
    this.challengeId,
    this.createdAt,
    this.challenge,
  });

  ChallengeClaimModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        userId = json['userId'] as int?,
        challengeId = json['challengeId'] as int?,
        createdAt = json['createdAt'] as String?,
        challenge = (json['challenge'] as Map<String, dynamic>?) != null
            ? ChallengeItemModel.fromJson(
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
