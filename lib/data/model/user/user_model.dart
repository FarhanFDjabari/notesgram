import 'package:hive/hive.dart';
import 'package:notesgram/data/model/user/user_count_model.dart';
import 'package:notesgram/data/sources/local/hive/hive_types.dart';
import 'package:notesgram/data/sources/remote/wrapper/model_factory.dart';

part 'user_model.g.dart';

@HiveType(typeId: HiveTypes.USER)
class UserModel implements ModelFactory {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? email;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final String? username;
  @HiveField(4)
  final String? googleId;
  @HiveField(5)
  final String? firebaseId;
  @HiveField(6)
  final String? avatarUrl;
  @HiveField(7)
  final int? coins;
  @HiveField(8)
  final String? createdAt;
  @HiveField(9)
  final String? updatedAt;
  @HiveField(10)
  final UserCountModel? cCount;
  @HiveField(11)
  final bool? isFollowed;
  @HiveField(12)
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
