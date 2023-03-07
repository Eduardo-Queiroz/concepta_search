// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestion.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SuggestionEntityAdapter extends TypeAdapter<SuggestionEntity> {
  @override
  final int typeId = 0;

  @override
  SuggestionEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SuggestionEntity(
      suggestions: (fields[1] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, SuggestionEntity obj) {
    writer
      ..writeByte(1)
      ..writeByte(1)
      ..write(obj.suggestions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SuggestionEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
