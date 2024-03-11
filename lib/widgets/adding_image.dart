import 'package:elysium/constants/colors.dart';
import 'package:flutter/material.dart';

class AddingImage extends StatefulWidget {
  const AddingImage({
    super.key,
  });

  @override
  State<AddingImage> createState() => _AddingImageState();
}

class _AddingImageState extends State<AddingImage> {
  /*
  File? pickedImageFill;
  void pickImage() async {
    final XFile? image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    if (image != null) {
      return;
    }
    setState(() {
      pickedImageFill = File(image!.path);
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //  onTap: pickImage,
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 3,
            color: Colors.grey,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: Row(
            children: [
              const Text(
                'If you wanna create a painting \nbut you cannot describe it verbally',
                style: TextStyle(
                  color: primaryColor,
                ),
              ),
              const Spacer(),
              Image.asset('images/gallery-add.png')
            ],
          ),
        ),
      ),
    );
  }
}
