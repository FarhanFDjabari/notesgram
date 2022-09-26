import 'package:notesgram/data/sources/remote/wrapper/model_factory.dart';

class BookmarkModel implements ModelFactory {
  final int? id;
  final int? bookmarkerId;
  final int? postId;
  final String? createdAt;

  BookmarkModel({
    this.id,
    this.bookmarkerId,
    this.postId,
    this.createdAt,
  });

  BookmarkModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        bookmarkerId = json['bookmarkerId'] as int?,
        postId = json['postId'] as int?,
        createdAt = json['createdAt'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'bookmarkerId': bookmarkerId,
        'postId': postId,
        'createdAt': createdAt
      };
}
