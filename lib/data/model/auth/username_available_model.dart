import 'package:notesgram/data/sources/remote/wrapper/model_factory.dart';

class UsernameAvailableModel implements ModelFactory {
  final bool? isAvailable;

  UsernameAvailableModel({
    this.isAvailable,
  });

  UsernameAvailableModel.fromJson(Map<String, dynamic> json)
      : isAvailable = json['is_available'] as bool?;

  Map<String, dynamic> toJson() => {'is_available': isAvailable};
}
