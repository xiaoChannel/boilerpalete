import 'package:isar/isar.dart';

import 'student.dart';
import 'teacher.dart';

part 'course.g.dart';

@collection
class Course {
  Id id = Isar.autoIncrement;
  late String title;

  @Backlink(to: "course")
  final teacher = IsarLink<Teacher>();

  @Backlink(to: "courses")
  final students = IsarLinks<Student>();
}
