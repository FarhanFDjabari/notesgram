import 'package:notesgram/data/model/user/user_model.dart';
import 'package:notesgram/data/sources/remote/wrapper/model_factory.dart';

class AuthModel implements ModelFactory {
  final UserModel? user;
  final String? token;

  AuthModel({
    this.user,
    this.token,
  });

  AuthModel.fromJson(Map<String, dynamic> json)
      : user = (json['user'] as Map<String, dynamic>?) != null
            ? UserModel.fromJson(json['user'] as Map<String, dynamic>)
            : null,
        token = json['token'] as String?;

  Map<String, dynamic> toJson() => {'user': user?.toJson(), 'token': token};
}
