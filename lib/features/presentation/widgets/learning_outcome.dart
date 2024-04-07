import 'package:e_learning/features/data/model/course_model.dart';
import 'package:flutter/material.dart';

class LearningOutcome extends StatelessWidget {
  const LearningOutcome({
    super.key,
    required this.courseData,
  });

  final Data courseData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (String topic
        in courseData.learningTopic!)
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 4),
            child: Row(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                const Icon(Icons.arrow_right),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    topic,
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
}