import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_app/modules/course_detail/course_controller.dart';
import 'package:get/get.dart';

import '../../../data/database/isar_service.dart';

class CourseModal extends StatelessWidget {
  final IsarService service;
  const CourseModal(this.service, {super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CourseController(service));
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
      color: Colors.white,
      child: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Course Name", style: Theme.of(context).textTheme.labelLarge),
              TextFormField(
                controller: controller.textController,
                autofocus: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Course Name is not allowed to be empty";
                  }
                  return null;
                },
              ),
              ElevatedButton(onPressed: controller.submit, child: const Text("Add new Course"))
            ],
          ),
        ),
      ),
    );
  }
}
