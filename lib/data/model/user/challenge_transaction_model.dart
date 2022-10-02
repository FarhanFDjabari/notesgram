import 'package:notesgram/data/sources/remote/wrapper/model_factory.dart';

class ChallengeTransactionModel implements ModelFactory {
  final int? id;
  final String? period;
  final String? category;
  final String? title;
  final String? description;
  final String? endAt;
  final int? count;
  final int? reward;
  final String? createdAt;

  ChallengeTransactionModel({
    this.id,
    this.period,
    this.category,
    this.title,
    this.description,
    this.endAt,
    this.count,
    this.reward,
    this.createdAt,
  });

  ChallengeTransactionModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        period = json['period'] as String?,
        category = json['category'] as String?,
        title = json['title'] as String?,
        description = json['description'] as String?,
        endAt = json['endAt'] as String?,
        count = json['count'] as int?,
        reward = json['reward'] as int?,
        createdAt = json['createdAt'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'period': period,
        'category': category,
        'title': title,
        'description': description,
        'endAt': endAt,
        'count': count,
        'reward': reward,
        'createdAt': createdAt
      };
}
