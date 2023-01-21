// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bmi_history_result.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BMIHistoryResultAdapter extends TypeAdapter<BMIHistoryResult> {
  @override
  final int typeId = 1;

  @override
  BMIHistoryResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BMIHistoryResult(
      id: fields[0] as int,
      memberId: fields[1] as int,
      progressDate: fields[2] as String,
      weight: fields[3] as int,
      height: fields[4] as int,
      bmi: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, BMIHistoryResult obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.memberId)
      ..writeByte(2)
      ..write(obj.progressDate)
      ..writeByte(3)
      ..write(obj.weight)
      ..writeByte(4)
      ..write(obj.height)
      ..writeByte(5)
      ..write(obj.bmi);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BMIHistoryResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
