// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as int?,
      userName: fields[1] as String?,
      firstName: fields[2] as String?,
      lastName: fields[3] as String?,
      address: fields[4] as String?,
      contactNo: fields[5] as String?,
      email: fields[6] as String?,
      nic: fields[7] as String?,
      rollId: fields[8] as int?,
      instituteId: fields[9] as String?,
      activeStatus: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.firstName)
      ..writeByte(3)
      ..write(obj.lastName)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.contactNo)
      ..writeByte(6)
      ..write(obj.email)
      ..writeByte(7)
      ..write(obj.nic)
      ..writeByte(8)
      ..write(obj.rollId)
      ..writeByte(9)
      ..write(obj.instituteId)
      ..writeByte(10)
      ..write(obj.activeStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
