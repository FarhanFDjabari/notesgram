import 'package:notesgram/data/model/note/folder_note_model.dart';
import 'package:notesgram/data/sources/remote/wrapper/model_factory.dart';

class BookmarkedNotesFolderModel implements ModelFactory {
  final int? id;
  final String? name;
  final int? userId;
  final String? createdAt;
  final String? updatedAt;
  final List<FolderNoteModel>? notes;
  final List<int>? noteIds;

  BookmarkedNotesFolderModel({
    this.id,
    this.name,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.notes,
    this.noteIds,
  });

  BookmarkedNotesFolderModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        userId = json['userId'] as int?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        notes = (json['notes'] as List?)
            ?.map((dynamic e) =>
                FolderNoteModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        noteIds =
            (json['note_ids'] as List?)?.map((dynamic e) => e as int).toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'userId': userId,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'notes': notes?.map((e) => e.toJson()).toList(),
        'note_ids': noteIds
      };
}
