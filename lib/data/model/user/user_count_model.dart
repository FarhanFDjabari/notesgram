import 'package:hive/hive.dart';
import 'package:notesgram/data/sources/local/hive/hive_types.dart';
import 'package:notesgram/data/sources/remote/wrapper/model_factory.dart';

part 'user_count_model.g.dart';

@HiveType(typeId: HiveTypes.USERCOUNT)
class UserCountModel implements ModelFactory {
  @HiveField(0)
  final int? posts;
  @HiveField(1)
  final int? followers;
  @HiveField(2)
  final int? followings;
  @HiveField(3)
  final int? likes;
  @HiveField(4)
  final int? comments;
  @HiveField(5)
  final int? purchases;

  UserCountModel({
    this.posts,
    this.followers,
    this.followings,
    this.comments,
    this.likes,
    this.purchases,
  });

  UserCountModel.fromJson(Map<String, dynamic> json)
      : posts = json['posts'],
        followers = json['followers'],
        followings = json['followings'],
        likes = json['likes'] as int?,
        comments = json['comments'] as int?,
        purchases = json['purchases'] as int?;

  Map<String, dynamic> toJson() => {
        'posts': posts,
        'followers': followers,
        'followings': followings,
        'likes': likes,
        'comments': comments,
        'purchases': purchases
      };
}
