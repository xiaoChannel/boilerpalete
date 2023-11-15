import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/database/entities/student.dart';
import '../../../data/database/isar_service.dart';

class StudentController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  List<int> selectedCourseIds = [];
  final IsarService service;

  StudentController(this.service);

  void selectCourses(List<int> value) {
    selectedCourseIds = value;
  }

  void submit() async {
    if (formKey.currentState!.validate()) {
      final selectedCourses = await service.getCoursesByIds(selectedCourseIds);

      service.saveStudent(
        Student()
          ..name = textController.text
          ..courses.addAll(selectedCourses),
      );

      Get.back();
    }
  }
}
