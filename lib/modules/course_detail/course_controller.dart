import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../data/database/entities/course.dart';
import '../../data/database/isar_service.dart';

class CourseController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  final IsarService service;

  CourseController(this.service);

  void submit() {
    if (formKey.currentState!.validate()) {
      service.saveCourse(
        Course()..title = textController.text,
      );

      Get.back();
    }
  }
}
