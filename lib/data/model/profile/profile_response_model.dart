import 'package:notesgram/data/model/user/user_model.dart';
import 'package:notesgram/data/sources/remote/wrapper/model_factory.dart';

class ProfileResponseModel implements ModelFactory {
  final UserModel? userModel;
  final bool? isFollowed;

  ProfileResponseModel({this.userModel, this.isFollowed});

  ProfileResponseModel.fromJson(Map<String, dynamic> json)
      : userModel =
            json['user'] != null ? UserModel.fromJson(json['user']) : null,
        isFollowed = json['is_followed'];
}
