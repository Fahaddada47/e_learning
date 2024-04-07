import 'package:flutter/material.dart';

class DescriptionWidget extends StatefulWidget {
  final String description;

  const DescriptionWidget({Key? key, required this.description}) : super(key: key);

  @override
  _DescriptionWidgetState createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<DescriptionWidget> {
  bool showFullDescription = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            showFullDescription
                ? widget.description
                : widget.description.split('\n').take(5).join('\n'),
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF666666),
            ),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (!showFullDescription)
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
