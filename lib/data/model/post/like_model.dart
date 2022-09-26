import 'package:notesgram/data/sources/remote/wrapper/model_factory.dart';

class LikeModel implements ModelFactory {
  final int? id;
  final int? likerId;
  final int? postId;
  final String? createdAt;

  LikeModel({
    this.id,
    this.likerId,
    this.postId,
    this.createdAt,
  });

  LikeModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        likerId = json['likerId'] as int?,
        postId = json['postId'] as int?,
        createdAt = json['createdAt'] as String?;

  Map<String, dynamic> toJson() =>
      {'id': id, 'likerId': likerId, 'postId': postId, 'createdAt': createdAt};
}
