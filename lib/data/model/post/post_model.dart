import 'package:notesgram/data/model/note/note_model.dart';
import 'package:notesgram/data/model/post/bookmark_model.dart';
import 'package:notesgram/data/model/post/comment_model.dart';
import 'package:notesgram/data/model/post/like_model.dart';
import 'package:notesgram/data/model/user/user_count_model.dart';
import 'package:notesgram/data/model/user/user_model.dart';
import 'package:notesgram/data/sources/remote/wrapper/model_factory.dart';

class PostModel implements ModelFactory {
  final int? id;
  final String? caption;
  final String? createdAt;
  final String? updatedAt;
  final int? userId;
  final NoteModel? note;
  final UserModel? user;
  final List<CommentModel>? comments;
  final List<LikeModel>? likes;
  final List<BookmarkModel>? bookmarks;
  final UserCountModel? count;
  final bool? isLiked;
  final bool? isBookmarked;

  PostModel({
    this.id,
    this.caption,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.note,
    this.user,
    this.likes,
    this.comments,
    this.bookmarks,
    this.count,
    this.isLiked,
    this.isBookmarked,
  });

  PostModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        caption = json['caption'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        userId = json['userId'] as int?,
        note = (json['note'] as Map<String, dynamic>?) != null
            ? NoteModel.fromJson(json['note'] as Map<String, dynamic>)
            : null,
        user = (json['user'] as Map<String, dynamic>?) != null
            ? UserModel.fromJson(json['user'] as Map<String, dynamic>)
            : null,
        comments = (json['comments'] as List?)
            ?.map(
                (dynamic e) => CommentModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        // TODO: differ field name with all post model
        likes = (json['likes'] as List?)
            ?.map((dynamic e) => LikeModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        bookmarks = (json['bookmarks'] as List?)
            ?.map((dynamic e) =>
                BookmarkModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        count = (json['_count'] as Map<String, dynamic>?) != null
            ? UserCountModel.fromJson(json['_count'] as Map<String, dynamic>)
            : null,
        isLiked = json['is_liked'] as bool?,
        isBookmarked = json['is_bookmarked'] as bool?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'caption': caption,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'userId': userId,
        'note': note?.toJson(),
        'user': user?.toJson(),
        'comments': comments?.map((e) => e.toJson()).toList(),
        'likes': likes?.map((e) => e.toJson()).toList(),
        'bookmarks': bookmarks?.map((e) => e.toJson()).toList(),
        '_count': count?.toJson(),
        'is_liked': isLiked,
        'is_bookmarked': isBookmarked
      };
}
