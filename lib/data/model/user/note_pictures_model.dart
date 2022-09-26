import 'package:notesgram/data/sources/remote/wrapper/model_factory.dart';

class NotePicturesModel implements ModelFactory {
  final int? id;
  final String? pictureUrl;
  final String? createdAt;
  final String? updatedAt;
  final int? noteId;

  NotePicturesModel({
    this.id,
    this.pictureUrl,
    this.createdAt,
    this.updatedAt,
    this.noteId,
  });

  NotePicturesModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        pictureUrl = json['picture_url'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        noteId = json['noteId'] as int?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'picture_url': pictureUrl,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'noteId': noteId
      };
}
