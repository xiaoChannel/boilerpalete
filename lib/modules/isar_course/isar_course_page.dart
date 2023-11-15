import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/database/entities/course.dart';
import '../../data/database/isar_service.dart';
import '../course_detail/course_detail_page.dart';
import '../../utils/theme_util.dart';
import 'widget/course_modal.dart';
import 'widget/student_modal.dart';
import 'widget/teacher_modal.dart';

class IsarCourse extends GetView {
  IsarCourse({super.key});

  final service = IsarService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Stored Courses"),
      ),
      backgroundColor: GMTheme.cBandBlack,
      body: Container(
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                child: StreamBuilder<List<Course>>(
                  stream: service.listenToCourses(),
                  builder: (context, snapshot) => GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    scrollDirection: Axis.horizontal,
                    children: snapshot.hasData
                        ? snapshot.data!.map((course) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 214, 117, 13),
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                CourseDetailPage.navigate(context, course, service);
                              },
                              child: Text(course.title),
                            );
                          }).toList()
                        : [],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(Wrap(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: CourseModal(service),
                    ),
                  ],
                ));
              },
              child: const Text("Add Course"),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(Wrap(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: StudentModal(service),
                    )
                  ],
                ));
              },
              child: const Text("Add Student"),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                  Wrap(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: TeacherModal(service),
                      )
                    ],
                  ),
                );
              },
              child: const Text("Add Teacher"),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
