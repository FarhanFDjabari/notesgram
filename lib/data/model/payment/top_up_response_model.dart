import 'package:notesgram/data/sources/remote/wrapper/model_factory.dart';

class TopUpResponseModel implements ModelFactory {
  final TopUpPaymentModel? payment;
  final String? id;
  final int? userId;
  final int? amount;
  final dynamic paymentMethod;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  TopUpResponseModel({
    this.payment,
    this.id,
    this.userId,
    this.amount,
    this.paymentMethod,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  TopUpResponseModel.fromJson(Map<String, dynamic> json)
      : payment = (json['payment'] as Map<String, dynamic>?) != null
            ? TopUpPaymentModel.fromJson(
                json['payment'] as Map<String, dynamic>)
            : null,
        id = json['id'] as String?,
        userId = json['userId'] as int?,
        amount = json['amount'] as int?,
        paymentMethod = json['payment_method'],
        status = json['status'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?;

  Map<String, dynamic> toJson() => {
        'payment': payment?.toJson(),
        'id': id,
        'userId': userId,
        'amount': amount,
        'payment_method': paymentMethod,
        'status': status,
        'createdAt': createdAt,
        'updatedAt': updatedAt
      };
}

class TopUpPaymentModel implements ModelFactory {
  final String? paymentLinkId;
  final String? message;
  final String? emailStatus;
  final String? url;
  final bool? status;

  TopUpPaymentModel({
    this.paymentLinkId,
    this.message,
    this.emailStatus,
    this.url,
    this.status,
  });

  TopUpPaymentModel.fromJson(Map<String, dynamic> json)
      : paymentLinkId = json['payment_link_id'] as String?,
        message = json['message'] as String?,
        emailStatus = json['email_status'] as String?,
        url = json['url'] as String?,
        status = json['status'] as bool?;

  Map<String, dynamic> toJson() => {
        'payment_link_id': paymentLinkId,
        'message': message,
        'email_status': emailStatus,
        'url': url,
        'status': status
      };
}
