// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_courses_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CourseEntityAdapter extends TypeAdapter<CourseEntity> {
  @override
  final int typeId = 0;

  @override
  CourseEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CourseEntity(
      id: fields[0] as int,
      name: fields[1] as String,
      description: fields[3] as String,
      price: fields[4] as double,
      imageUrl: fields[5] as String,
      mentorName: fields[6] as String,
      mentorTitle: fields[7] as String,
      mentorImageUrl: fields[8] as String,
      tools: (fields[9] as List).cast<String>(),
      rating: fields[10] as double,
      numRatings: fields[11] as int,
      reviews: (fields[12] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, CourseEntity obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.imageUrl)
      ..writeByte(6)
      ..write(obj.mentorName)
      ..writeByte(7)
      ..write(obj.mentorTitle)
      ..writeByte(8)
      ..write(obj.mentorImageUrl)
      ..writeByte(9)
      ..write(obj.tools)
      ..writeByte(10)
      ..write(obj.rating)
      ..writeByte(11)
      ..write(obj.numRatings)
      ..writeByte(12)
      ..write(obj.reviews);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
