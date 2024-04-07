// course_details_buttons.dart
import 'package:flutter/material.dart';

class CourseDetailsButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFEDEBFA),
                border: Border.all(
                  color: const Color(0xFF7455F7),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: const Center(
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                    color: Color(0xFF7455F7),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFEDEBFA),
                border: Border.all(
                  color: const Color(0xFF7455F7),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: const Center(
                child: Text(
                  'Add to Wishlist',
                  style: TextStyle(
                    color: Color(0xFF7455F7),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
