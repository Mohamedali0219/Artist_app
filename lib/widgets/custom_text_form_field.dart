import 'package:elysium/constants/colors.dart';
import 'package:elysium/const.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.title,
    required this.hintText,
    this.maxLines = 1,
    this.width = double.infinity,
    this.height = 82,
  });
  final String title;
  final String hintText;
  final int? maxLines;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textStyle(
            fontSize: 17.77,
            fontWeight: FontWeight.w600,
            color: titleColor.withOpacity(0.76),
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xffF0F1F3),
          ),
          child: TextFormField(
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            style: textStyle(
              fontSize: 20.39,
              color: const Color(
                0xff999999,
              ),
            ),
            maxLines: maxLines,
            cursorColor: const Color(
              0xff999999,
            ),
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: textStyle(
                  fontSize: 20.39,
                  color: const Color(
                    0xff999999,
                  ),
                ),
                enabledBorder: textFormStyleBorder(),
                focusedBorder: textFormStyleBorder()),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder textFormStyleBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Color(0xffF0F1F3),
      ),
    );
  }
}
