
import 'package:e_learning_app/features/Cources/domain/entities/all_courses_entity.dart';
class AllCoursesLocalData {
static final List<CourseEntity> courses = [
  const CourseEntity(
    id: 1,
    name: 'Introduction to Programming',
    description:
        'Learn the fundamentals of programming languages and concepts.',
    price: 19.99,
    imageUrl: 'assets/course.png',
    mentorName: '',
    mentorTitle: '',
    mentorImageUrl: '',
    tools: [],
    numRatings: 5,
    rating: 5,
    reviews: [],
    isSaved:true
  ),
  const CourseEntity(
    id: 2,
    name: 'Data Structures and Algorithms',
    description: 'Explore data structures and algorithms.',
    price: 24.99,
    imageUrl: 'assets/course.png',
    mentorName: '',
    mentorTitle: '',
    mentorImageUrl: '',
    tools: [],
    numRatings: 10,
    rating: 4.5,
    reviews: [],
    isSaved:true

  ),
  const CourseEntity(
    id: 3,
    name: 'Mobile App Development with Flutter',
    description: 'Build cross-platform mobile apps with Flutter.',
    price: 29.99,
    imageUrl: 'assets/course.png',
    mentorName: '',
    mentorTitle: '',
    mentorImageUrl: '',
    tools: [],
    numRatings: 8,
    rating: 4.8,
    reviews: [],
    isSaved:false
  ),
  const CourseEntity(
    id: 4,
    name: 'Web Development with React',
    description: 'Learn modern web development with React.js.',
    price: 27.99,
    imageUrl: 'assets/course.png',
    mentorName: '',
    mentorTitle: '',
    mentorImageUrl: '',
    tools: [],
    numRatings: 7,
    rating: 4.7,
    reviews: [],
    isSaved:false

  ),
  const CourseEntity(
    id: 5,
    name: 'Machine Learning Foundations',
    description: 'Get started with the basics of machine learning.',
    price: 34.99,
    imageUrl: 'assets/course.png',
    mentorName: '',
    mentorTitle: '',
    mentorImageUrl: '',
    tools: [],
    numRatings: 12,
    rating: 4.9,
    reviews: [],
    isSaved:false
  ),
  const CourseEntity(
    id: 6,
    name: 'Database Management Essentials',
    description: 'Learn essential concepts of database management.',
    price: 22.99,
    imageUrl: 'assets/course.png',
    mentorName: '',
    mentorTitle: '',
    mentorImageUrl: '',
    tools: [],
    numRatings: 6,
    rating: 4.6,
    reviews: [],
    isSaved:true
  ),
  const CourseEntity(
    id: 7,
    name: 'UI/UX Design Fundamentals',
    description: 'Master the basics of UI/UX design.',
    price: 26.99,
    imageUrl: 'assets/course.png',
    mentorName: '',
    mentorTitle: '',
    mentorImageUrl: '',
    tools: [],
    numRatings: 9,
    rating: 4.7,
    reviews: [],
    isSaved:false
  ),
  const CourseEntity(
    id: 8,
    name: 'Digital Marketing Strategies',
    description: 'Learn effective digital marketing strategies.',
    price: 31.99,
    imageUrl: 'assets/course.png',
    mentorName: '',
    mentorTitle: '',
    mentorImageUrl: '',
    tools: [],
    numRatings: 11,
    rating: 4.8,
    reviews: [],
    isSaved:false
  ),
  const CourseEntity(
    id: 9,
    name: 'Cybersecurity Fundamentals',
    description: 'Understand the basics of cybersecurity.',
    price: 28.99,
    imageUrl: 'assets/course.png',
    mentorName: '',
    mentorTitle: '',
    mentorImageUrl: '',
    tools: [],
    numRatings: 7,
    rating: 4.6,
    reviews: [],
    isSaved:false
  ),
  const CourseEntity(
    id: 10,
    name: 'Business Analytics Essentials',
    description: 'Learn essential analytics skills for business.',
    price: 29.99,
    imageUrl: 'assets/course.png',
    mentorName: '',
    mentorTitle: '',
    mentorImageUrl: '',
    tools: [],
    numRatings: 9,
    rating: 4.7,
    reviews: [],
    isSaved:false
  ),
];
}