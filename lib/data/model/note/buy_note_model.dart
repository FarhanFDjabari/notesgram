import 'package:notesgram/data/model/note/note_model.dart';
import 'package:notesgram/data/sources/remote/wrapper/model_factory.dart';

class BuyNoteModel implements ModelFactory {
  final int? id;
  final int? userId;
  final int? noteId;
  final String? createdAt;
  final String? updatedAt;
  final NoteModel? note;

  BuyNoteModel({
    this.id,
    this.userId,
    this.noteId,
    this.createdAt,
    this.updatedAt,
    this.note,
  });

  BuyNoteModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        userId = json['userId'] as int?,
        noteId = json['noteId'] as int?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        note = (json['note'] as Map<String, dynamic>?) != null
            ? NoteModel.fromJson(json['note'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'noteId': noteId,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'note': note?.toJson()
      };
}
