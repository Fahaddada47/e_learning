import 'package:flutter/material.dart';

class CourseDetailsButtons extends StatelessWidget {
  const CourseDetailsButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFF7455F7),
              onPrimary: Colors.white, // Text color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: const SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Buy Now',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          SizedBox(height: 12,),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDEBFA),
                      // Background color
                      border: Border.all(
                          color: const Color(0xFF7455F7),
                          width: 1),
                      // Border color
                      borderRadius: BorderRadius.circular(
                          4), // Border radius
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12),
                    child: const Center(
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(
                          color: Color(
                              0xFF7455F7), // Text color
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // Adding some space between buttons
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Add functionality here for adding to wishlist
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDEBFA),
                      // Background color
                      border: Border.all(
                          color: const Color(0xFF7455F7),
                          width: 1),
                      // Border color
                      borderRadius: BorderRadius.circular(
                          4), // Border radius
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12),
                    child: const Center(
                      child: Text(
                        'Add to Wishlist',
                        style: TextStyle(
                          color: Color(
                              0xFF7455F7), // Text color
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}