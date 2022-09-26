import 'package:notesgram/data/model/user/user_count_model.dart';
import 'package:notesgram/data/sources/remote/wrapper/model_factory.dart';

class UserModel implements ModelFactory {
  final int? id;
  final String? email;
  final String? name;
  final String? username;
  final String? googleId;
  final String? firebaseId;
  final String? avatarUrl;
  final int? coins;
  final String? createdAt;
  final String? updatedAt;
  final UserCountModel? cCount;
  final bool? isFollowed;
  final bool? isAdmin;

  UserModel({
    this.id,
    this.email,
    this.name,
    this.username,
    this.googleId,
    this.firebaseId,
    this.avatarUrl,
    this.coins,
    this.createdAt,
    this.updatedAt,
    this.cCount,
    this.isFollowed,
    this.isAdmin,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        name = json['name'],
        username = json['username'],
        googleId = json['google_id'],
        firebaseId = json['firebase_id'],
        avatarUrl = json['avatar_url'],
        coins = json['coins'],
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'],
        cCount = json['_count'] != null
            ? UserCountModel.fromJson(json['_count'])
            : null,
        isFollowed = json['is_followed'] as bool?,
        isAdmin = json['is_admin'] as bool?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'username': username,
        'google_id': googleId,
        'firebase_id': firebaseId,
        'avatar_url': avatarUrl,
        'coins': coins,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '_count': cCount != null ? cCount!.toJson() : null,
        'is_followed': isFollowed,
        'is_admin': isAdmin
      };
}
