// course_details_buttons.dart
import 'package:flutter/material.dart';

class CourseDetailsButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity, // Full width
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), // Circular radius
            color: Colors.blue, // Blue color
          ),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent, // Transparent background
              elevation: 0, // No elevation
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Buy now',
                style: TextStyle(
                  color: Colors.white, // White text color
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8,),

        Row(
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
        ),
      ],
    );
  }
}
