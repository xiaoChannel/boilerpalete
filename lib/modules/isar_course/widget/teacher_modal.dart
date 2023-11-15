import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_boilerplate_app/modules/isar_course/widget/teacher_controller.dart';

import '../../../data/database/entities/course.dart';
import '../../../data/database/isar_service.dart';

class TeacherModal extends StatelessWidget {
  final IsarService service;
  const TeacherModal(this.service, {super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TeacherController(service));

    return Form(
      key: controller.formKey,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Teacher Name", style: Theme.of(context).textTheme.labelLarge),
                TextFormField(
                  controller: controller.textController,
                  autofocus: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Teacher Name is not allowed to be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                Text("Teach Course", style: Theme.of(context).textTheme.labelLarge),
                FutureBuilder<List<Course>>(
                  future: service.getAllCourses(),
                  builder: (context, AsyncSnapshot<List<Course>> snapshot) {
                    if (snapshot.hasData) {
                      List<Course> data = snapshot.data!;
                      // selectedCourse = data.first;
                      final courseOptions = data.map((course) {
                        return DropdownMenuItem<int>(
                          value: course.id,
                          child: Text(course.title),
                        );
                      }).toList();

                      return DropdownButtonFormField<int>(
                        items: courseOptions,
                        value: controller.selectedCourseId,
                        onChanged: controller.selectCourseId,
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
                ElevatedButton(onPressed: controller.submit, child: const Text("Add new teacher"))
              ],
            ),
          )),
    );
  }
}
