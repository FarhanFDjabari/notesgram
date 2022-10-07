// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      id: fields[0] as int?,
      email: fields[1] as String?,
      name: fields[2] as String?,
      username: fields[3] as String?,
      googleId: fields[4] as String?,
      firebaseId: fields[5] as String?,
      avatarUrl: fields[6] as String?,
      coins: fields[7] as int?,
      createdAt: fields[8] as String?,
      updatedAt: fields[9] as String?,
      cCount: fields[10] as UserCountModel?,
      isFollowed: fields[11] as bool?,
      isAdmin: fields[12] as bool?,
      fcmToken: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.username)
      ..writeByte(4)
      ..write(obj.googleId)
      ..writeByte(5)
      ..write(obj.firebaseId)
      ..writeByte(6)
      ..write(obj.avatarUrl)
      ..writeByte(7)
      ..write(obj.coins)
      ..writeByte(8)
      ..write(obj.createdAt)
      ..writeByte(9)
      ..write(obj.updatedAt)
      ..writeByte(10)
      ..write(obj.cCount)
      ..writeByte(11)
      ..write(obj.isFollowed)
      ..writeByte(12)
      ..write(obj.isAdmin)
      ..writeByte(13)
      ..write(obj.fcmToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
