import 'dart:math';

import 'package:e_learning/features/data/model/course_model.dart';
import 'package:e_learning/features/data/response/status.dart';
import 'package:e_learning/features/domain/state_holders/course_description_controller.dart';
import 'package:e_learning/features/presentation/widgets/course_thubnil.dart';
import 'package:e_learning/features/presentation/widgets/learning_outcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../widgets/course_details_buttons.dart';

class HomePageScreen extends StatefulWidget {
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final homeController = Get.put(HomeController());
  int? selectedIndex;
  bool showAllSections = false;
  bool showFullDescription = false;

  @override
  void initState() {
    super.initState();
    homeController.courseListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7455F7),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text(
          'Course Details',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {},
          ),
        ],
        backgroundColor: const Color(0xFF7455F7),
      ),
      body: Obx(() {
        switch (homeController.rxRequestStatus.value) {
          case Status.LOADING:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case Status.ERROR:
            if (homeController.error.value == "No internet") {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          case Status.COMPLETED:
            final courseData = homeController.courseList.value.data!;
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          course_thubnil(courseData: courseData),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 30),
                              CourseHeader(courseData),
                              const SizedBox(
                                height: 8,
                              ),
                              CourseDetailsButtons(),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "What you'll learn",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              LearningOutcome(courseData: courseData),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                "Course Curriculum",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              CourseCurriculum(courseData),
                              const SizedBox(
                                height: 16,
                              ),
                              const Text(
                                "This course includes 'DATA NOT AVAILBLE'",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              LearningOutcome(courseData: courseData),
                              const SizedBox(
                                height: 16,
                              ),
                              const Text(
                                "Requirements",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Requirments(courseData),
                              const SizedBox(
                                height: 16,
                              ),
                              const Text(
                                "Description",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Description(courseData),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
        }
      }),
    );
  }

  Column CourseHeader(Data courseData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          courseData.title.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          courseData.subTitle.toString(),
          style: const TextStyle(
            fontSize: 15,
            height: 1.33,
            color: Color(0xFF666666),
          ),
        ),
        const SizedBox(height: 11),
        Row(
          children: [
            Text(
              courseData.categoryId.toString(),
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            const Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            const Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            const Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            const Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            const Text("(25,00)"),
          ],
        ),
        const Text(
          '9,591 students',
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Text(
              "Mentor",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF666666),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              courseData.instructorId.toString(),
              style: const TextStyle(
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            const Icon(
              Icons.fact_check_outlined,
              color: Colors.grey,
            ),
            Text(
              'Last update ${courseData.updatedAt != null ? DateFormat('MM/yyyy').format(DateTime.parse(courseData.updatedAt!)) : 'N/A'}',
              style: const TextStyle(
                  color: Color(0xFF666666),
                  fontWeight: FontWeight.w500,
                  fontSize: 12),
            )
          ],
        ),
        const Row(
          children: [
            Icon(
              Icons.language_outlined,
              color: Colors.grey,
            ),
            // Text(courseData.language),
            Text(
              "English",
              style: TextStyle(
                  color: Color(0xFF666666),
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          'BDT ${courseData.price}',
          style: const TextStyle(
              fontSize: 26, fontWeight: FontWeight.w900, color: Colors.black54),
        ),
      ],
    );
  }

  Column CourseCurriculum(Data courseData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0;
            i <
                (showAllSections
                    ? courseData.sections!.length
                    : min(2, courseData.sections!.length));
            i++)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  'Section ${i + 1}: ${courseData.sections![i].topic ?? 'Topic'}',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: selectedIndex == i
                        ? const Color(0xFFA335F3)
                        : const Color(0xFF333333),
                  ),
                ),
                trailing: Icon(
                    selectedIndex == i ? Icons.expand_less : Icons.expand_more),
                onTap: () {
                  setState(() {
                    selectedIndex = selectedIndex == i ? null : i;
                  });
                },
              ),
              if (selectedIndex == i)
                Column(
                  children: [
                    for (var lesson in courseData.sections![i].lessons ?? [])
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.arrow_right),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                lesson.lectureTitle ?? 'Lesson',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF666666),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
            ],
          ),
        if (!showAllSections && courseData.sections!.length > 2)
          ElevatedButton(
            onPressed: () {
              setState(() {
                showAllSections = true;
              });
            },
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFFEDEBFA),
              onPrimary: Colors.white, // Text color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  '${courseData.sections!.length - 2} more section${courseData.sections!.length > 3 ? 's' : ''}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF7455F7),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Column Requirments(Data courseData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.arrow_right),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  courseData.requirements!.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF666666),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column Description(Data courseData) {
    return Column(
      children: [
        Text(
          showFullDescription
              ? courseData.description!
              : (courseData.description!.length > 200
                  ? courseData.description!.substring(0, 200) + '...'
                  : courseData.description!),
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF666666),
          ),
        ),
        if (courseData.description!.length > 200 && !showFullDescription)
          TextButton(
            onPressed: () {
              setState(() {
                showFullDescription = true;
              });
            },
            child: const Text('Show More'),
          ),
      ],
    );
  }
}
