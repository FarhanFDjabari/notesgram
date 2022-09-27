// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_count_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserCountModelAdapter extends TypeAdapter<UserCountModel> {
  @override
  final int typeId = 1;

  @override
  UserCountModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserCountModel(
      posts: fields[0] as int?,
      followers: fields[1] as int?,
      followings: fields[2] as int?,
      comments: fields[4] as int?,
      likes: fields[3] as int?,
      purchases: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, UserCountModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.posts)
      ..writeByte(1)
      ..write(obj.followers)
      ..writeByte(2)
      ..write(obj.followings)
      ..writeByte(3)
      ..write(obj.likes)
      ..writeByte(4)
      ..write(obj.comments)
      ..writeByte(5)
      ..write(obj.purchases);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserCountModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
