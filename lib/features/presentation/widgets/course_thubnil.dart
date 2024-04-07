import 'package:e_learning/features/data/model/course_model.dart';
import 'package:flutter/material.dart';

class course_thubnil extends StatelessWidget {
  const course_thubnil({
    super.key,
    required this.courseData,
  });

  final Data courseData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 365,
      height: 175,
      decoration: BoxDecoration(
        borderRadius:
        const BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          courseData.thumb!,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }
}