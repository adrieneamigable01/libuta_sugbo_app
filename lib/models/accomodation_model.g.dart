// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accomodation_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccomodationModelAdapter extends TypeAdapter<AccomodationModel> {
  @override
  final int typeId = 4;

  @override
  AccomodationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccomodationModel(
      accomodationId: fields[0] as dynamic,
      listingTypeId: fields[1] as dynamic,
      accomodation: fields[2] as String?,
      isActive: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AccomodationModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.accomodationId)
      ..writeByte(1)
      ..write(obj.listingTypeId)
      ..writeByte(2)
      ..write(obj.accomodation)
      ..writeByte(3)
      ..write(obj.isActive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccomodationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
