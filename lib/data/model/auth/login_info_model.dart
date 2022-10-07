import 'package:notesgram/data/model/user/user_model.dart';
import 'package:notesgram/data/sources/remote/wrapper/model_factory.dart';

class LoginInfoModel implements ModelFactory {
  final UserModel? userData;
  final String? token;

  LoginInfoModel({
    this.userData,
    this.token,
  });

  LoginInfoModel.fromJson(Map<String, dynamic> json)
      : userData = (json['user'] as Map<String, dynamic>?) != null
            ? UserModel.fromJson(json['user'] as Map<String, dynamic>)
            : null,
        token = json['token'] as String?;

  Map<String, dynamic> toJson() => {
        'user': userData?.toJson(),
        'token': token,
      };
}
