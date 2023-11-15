import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_boilerplate_app/modules/isar_course/widget/student_controller.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../data/database/entities/course.dart';
import '../../../data/database/isar_service.dart';

class StudentModal extends StatelessWidget {
  final IsarService service;
  const StudentModal(this.service, {super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StudentController(service));

    return Form(
        key: controller.formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Student Name", style: Theme.of(context).textTheme.labelLarge),
                TextFormField(
                  controller: controller.textController,
                  autofocus: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Student Name is not allowed to be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                Text("Choosed Courses", style: Theme.of(context).textTheme.labelLarge),
                FutureBuilder<List<Course>>(
                  future: service.getAllCourses(),
                  builder: (context, AsyncSnapshot<List<Course>> snapshot) {
                    if (snapshot.hasData) {
                      final courseOptions = snapshot.data!.map((course) {
                        return MultiSelectItem<int>(course.id, course.title);
                      }).toList();

                      return MultiSelectDialogField<int>(
                        items: courseOptions,
                        onConfirm: controller.selectCourses,
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
                ElevatedButton(
                  onPressed: controller.submit,
                  child: const Text("Add new student"),
                )
              ],
            ),
          ),
        ));
  }
}
