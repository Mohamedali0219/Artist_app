import 'package:flutter/material.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          width: 10,
          color: Colors.grey[100]!,
        ),
      ),
      child: Stack(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
              'images/profile.png',
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              //  onTap: () {},
              child: Container(
                  width: 35,
                  height: 35,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'images/editi_icon.png',
                      ),
                      fit: BoxFit.fill,
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
