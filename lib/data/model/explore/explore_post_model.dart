import 'package:notesgram/data/model/note/note_model.dart';
import 'package:notesgram/data/model/user/user_model.dart';
import 'package:notesgram/data/sources/remote/wrapper/model_factory.dart';

class ExplorePostModel implements ModelFactory {
  final List<NoteModel>? notes;
  final List<UserModel>? users;

  ExplorePostModel({
    this.notes,
    this.users,
  });

  ExplorePostModel.fromJson(Map<String, dynamic> json)
      : notes = (json['notes'] as List?)
            ?.map((dynamic e) => NoteModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        users = (json['users'] as List?)
            ?.map((dynamic e) => UserModel.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'notes': notes?.map((e) => e.toJson()).toList(),
        'users': users?.map((e) => e.toJson()).toList()
      };
}
