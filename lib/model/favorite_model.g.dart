// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoritemodelAdapter extends TypeAdapter<Favoritemodel> {
  @override
  final int typeId = 1;

  @override
  Favoritemodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Favoritemodel(
      name: fields[0] as String?,
      image: fields[1] as String?,
      description: fields[2] as String?,
      id: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Favoritemodel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoritemodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
