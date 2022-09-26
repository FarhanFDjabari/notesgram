import 'package:notesgram/data/model/note/purchase_model.dart';
import 'package:notesgram/data/model/post/post_model.dart';
import 'package:notesgram/data/model/user/note_pictures_model.dart';
import 'package:notesgram/data/model/user/user_count_model.dart';
import 'package:notesgram/data/sources/remote/wrapper/model_factory.dart';

class NoteModel implements ModelFactory {
  final int? id;
  final String? title;
  final int? price;
  final String? createdAt;
  final String? updatedAt;
  final int? postId;
  final PostModel? post;
  final List<NotePicturesModel>? notePictures;
  final List<PurchaseModel>? purchases;
  final UserCountModel? count;
  final bool? isPurchased;

  NoteModel({
    this.id,
    this.title,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.postId,
    this.post,
    this.notePictures,
    this.purchases,
    this.count,
    this.isPurchased,
  });

  NoteModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        price = json['price'] as int?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        postId = json['postId'] as int?,
        post = (json['post'] as Map<String, dynamic>?) != null
            ? PostModel.fromJson(json['post'] as Map<String, dynamic>)
            : null,
        notePictures = (json['note_pictures'] as List?)
            ?.map((dynamic e) =>
                NotePicturesModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        purchases = (json['purchases'] as List?)
            ?.map((dynamic e) =>
                PurchaseModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        count = (json['_count'] as Map<String, dynamic>?) != null
            ? UserCountModel.fromJson(json['_count'] as Map<String, dynamic>)
            : null,
        isPurchased = json['is_purchased'] as bool?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'postId': postId,
        'post': post?.toJson(),
        'note_pictures': notePictures?.map((e) => e.toJson()).toList(),
        'purchases': purchases?.map((e) => e.toJson()).toList(),
        '_count': count?.toJson(),
        'is_purchased': isPurchased
      };
}
