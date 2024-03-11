import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final String expandText;
  final String collapseText;
  final Color linkColor;

  const ExpandableText({
    super.key,
    required this.text,
    required this.expandText,
    required this.collapseText,
    this.linkColor = Colors.blue,
  });

  @override
  ExpandableTextState createState() => ExpandableTextState();
}

class ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: SizedBox(
                width: 0.84.sw, // Set an appropriate width for your case
                child: RichText(
                  maxLines: isExpanded ? 10000 : 3,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: widget.text,
                        style: const TextStyle(
                          color: Colors.black, // Set text color
                        ),
                      ),
                      if (!isExpanded)
                        const TextSpan(
                          text: '...', // Add three dots when not expanded
                          style: TextStyle(
                            color: Colors.black, // Set text color
                          ),
                        ),
                      TextSpan(
                        text: isExpanded
                            ? ' ${widget.collapseText}'
                            : ' ${widget.expandText}',
                        style: TextStyle(
                          color: widget.linkColor,
                        ),
                      ),
                    ],
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
