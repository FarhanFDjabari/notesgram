class ChallengeItemModel {
  final int? id;
  final String? period;
  final String? category;
  final String? title;
  final String? description;
  final String? endAt;
  final int? count;
  final int? reward;
  final String? createdAt;
  final List<dynamic>? challengeClaim;
  final int? currentProgress;
  final bool? canClaim;

  ChallengeItemModel({
    this.id,
    this.period,
    this.category,
    this.title,
    this.description,
    this.endAt,
    this.count,
    this.reward,
    this.createdAt,
    this.challengeClaim,
    this.currentProgress,
    this.canClaim,
  });

  ChallengeItemModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        period = json['period'] as String?,
        category = json['category'] as String?,
        title = json['title'] as String?,
        description = json['description'] as String?,
        endAt = json['endAt'] as String?,
        count = json['count'] as int?,
        reward = json['reward'] as int?,
        createdAt = json['createdAt'] as String?,
        challengeClaim = json['ChallengeClaim'] as List?,
        currentProgress = json['current_progress'] as int?,
        canClaim = json['can_claim'] as bool?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'period': period,
        'category': category,
        'title': title,
        'description': description,
        'endAt': endAt,
        'count': count,
        'reward': reward,
        'createdAt': createdAt,
        'ChallengeClaim': challengeClaim,
        'current_progress': currentProgress,
        'can_claim': canClaim
      };
}
