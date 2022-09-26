import 'package:notesgram/data/model/user/user_model.dart';
import 'package:notesgram/data/sources/remote/wrapper/model_factory.dart';

class CommentModel implements ModelFactory {
  final int? id;
  final int? commenterId;
  final int? postId;
  final String? comment;
  final String? createdAt;
  final UserModel? commenter;

  CommentModel({
    this.id,
    this.commenterId,
    this.postId,
    this.comment,
    this.createdAt,
    this.commenter,
  });

  CommentModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        commenterId = json['commenterId'] as int?,
        postId = json['postId'] as int?,
        comment = json['comment'] as String?,
        createdAt = json['createdAt'] as String?,
        commenter = (json['commenter'] as Map<String, dynamic>?) != null
            ? UserModel.fromJson(json['commenter'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'commenterId': commenterId,
        'postId': postId,
        'comment': comment,
        'createdAt': createdAt,
        'commenter': commenter?.toJson(),
      };
}
