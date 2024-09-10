import 'package:hive/hive.dart';
part 'all_courses_entity.g.dart';

@HiveType(typeId: 0)
 
class CourseEntity {
 @HiveField(0)
  final int id; // Unique identifier for the course
 @HiveField(1)
  final String name;
 @HiveField(3)
  final String description;
 @HiveField(4)
  final double price;
 @HiveField(5)
  final String imageUrl;
 @HiveField(6)
  final String mentorName;
 @HiveField(7)
  final String mentorTitle;
 @HiveField(8)
  final String mentorImageUrl;
 @HiveField(9)
  final List<String> tools; // List of tools required for the course
 @HiveField(10)
  final double rating;
 @HiveField(11)
  final int numRatings;
 @HiveField(12)
  final List reviews;
  
  const CourseEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.mentorName,
    required this.mentorTitle,
    required this.mentorImageUrl,
    required this.tools,
    required this.rating,
    required this.numRatings,
    required this.reviews,
  });
}
