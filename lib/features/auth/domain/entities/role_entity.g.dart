// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RoleEntityAdapter extends TypeAdapter<RoleEntity> {
  @override
  final int typeId = 1;

  @override
  RoleEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RoleEntity(
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RoleEntity obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoleEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
