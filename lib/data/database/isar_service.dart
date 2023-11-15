// This file holds the logic of isar db operations.
import 'package:isar/isar.dart';

import 'entities/course.dart';
import 'entities/student.dart';
import 'entities/teacher.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [CourseSchema, StudentSchema, TeacherSchema],
        inspector: true, directory: '/ss',
      );
    }

    return Future.value(Isar.getInstance());
  }

  Future<void> cleanDB() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }

  Future<void> saveCourse(Course newCourse) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.courses.putSync(newCourse));
  }

  Future<void> saveTeacher(Teacher newTeacher) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.teachers.putSync(newTeacher));
  }

  Future<void> saveStudent(Student newStudent) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.students.putSync(newStudent));
  }

  Future<List<Course>> getAllCourses() async {
    final isar = await db;
    return await isar.courses.where().findAll();
  }

  Stream<List<Course>> listenToCourses() async* {
    final isar = await db;
    yield* isar.courses.where().watch(fireImmediately: true);
  }

  Future<List<Student>> getStudentsFor(Course course) async {
    final isar = await db;
    return await isar.students.filter().courses((q) => q.idEqualTo(course.id)).findAll();
  }

  Future<Teacher?> getTeacherFor(Course course) async {
    final isar = await db;
    return await isar.teachers.filter().course((q) => q.idEqualTo(course.id)).findFirst();
  }

  Future<List<Course>> getCoursesByIds(ids) async {
    final isar = await db;
    return await isar.courses.filter().anyOf(ids, (q, int id) => q.idEqualTo(id)).findAll();
  }

  Future<Course?> getCoursesById(id) async {
    final isar = await db;
    return await isar.courses.filter().idEqualTo(id).findFirst();
  }
}
