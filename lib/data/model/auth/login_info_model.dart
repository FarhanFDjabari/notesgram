import 'package:notesgram/data/model/auth/login_firebase_response_model.dart';
import 'package:notesgram/data/model/notification/notification_model.dart';

class LoginInfoModel {
  final NotificationModel? notification;
  final LoginFirebaseResponseModel? firebaseResponse;

  LoginInfoModel({
    this.notification,
    this.firebaseResponse,
  });

  LoginInfoModel.fromJson(Map<String, dynamic> json)
      : notification = (json['notification'] as Map<String, dynamic>?) != null
            ? NotificationModel.fromJson(
                json['notification'] as Map<String, dynamic>)
            : null,
        firebaseResponse =
            (json['firebase_response'] as Map<String, dynamic>?) != null
                ? LoginFirebaseResponseModel.fromJson(
                    json['firebase_response'] as Map<String, dynamic>)
                : null;

  Map<String, dynamic> toJson() => {
        'notification': notification?.toJson(),
        'firebase_response': firebaseResponse?.toJson()
      };
}
