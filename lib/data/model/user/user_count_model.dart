import 'package:notesgram/data/sources/remote/wrapper/model_factory.dart';

class UserCountModel implements ModelFactory {
  final int? posts;
  final int? followers;
  final int? followings;
  final int? likes;
  final int? comments;
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
