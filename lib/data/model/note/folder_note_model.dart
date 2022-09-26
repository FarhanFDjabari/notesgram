import 'package:notesgram/data/model/note/note_model.dart';
import 'package:notesgram/data/sources/remote/wrapper/model_factory.dart';

class FolderNoteModel implements ModelFactory {
  final int? id;
  final int? noteId;
  final int? groupId;
  final String? createdAt;
  final String? updatedAt;
  final NoteModel? note;

  FolderNoteModel({
    this.id,
    this.noteId,
    this.groupId,
    this.createdAt,
    this.updatedAt,
    this.note,
  });

  FolderNoteModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        noteId = json['noteId'] as int?,
        groupId = json['groupId'] as int?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        note = (json['note'] as Map<String, dynamic>?) != null
            ? NoteModel.fromJson(json['note'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'noteId': noteId,
        'groupId': groupId,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'note': note?.toJson()
      };
}
