
import 'package:e_learning_app/features/Cources/domain/entities/all_courses_entity.dart';

class CourseModel extends CourseEntity{
  const CourseModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.imageUrl,
    required super.mentorName,
    required super.mentorTitle,
    required super.mentorImageUrl,
    required super.tools,
    required super.rating,
    required super.numRatings,
    required super.reviews,
  });
  
  factory CourseModel.fromJson(Map<String, dynamic> json) {
     //TODO fromjson
     throw UnimplementedError();
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    //TODO toJson
    return data;

  }
}

