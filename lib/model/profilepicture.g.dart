// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profilepicture.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfilePictureAdapter extends TypeAdapter<ProfilePicture> {
  @override
  final int typeId = 3;

  @override
  ProfilePicture read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfilePicture(
      profilepic: fields[0] as File?,
    );
  }

  @override
  void write(BinaryWriter writer, ProfilePicture obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.profilepic);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfilePictureAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
