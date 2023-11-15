import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/database/entities/teacher.dart';
import '../../../data/database/isar_service.dart';

class TeacherController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  int? selectedCourseId;
  final IsarService service;

  TeacherController(this.service);

  void selectCourseId(int? value) {
    selectedCourseId = value;
  }

  void submit() async {
    if (formKey.currentState!.validate()) {
      final selectedCourse = await service.getCoursesById(selectedCourseId);
      service.saveTeacher(
        Teacher()
          ..name = textController.text
          ..course.value = selectedCourse,
      );

      Get.back();
    }
  }
}
