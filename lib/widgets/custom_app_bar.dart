import 'package:elysium/constants/colors.dart';
import 'package:flutter/material.dart';

class DefultAppBar extends StatelessWidget {
  const DefultAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Container(
        decoration: const BoxDecoration(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 28,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black.withOpacity(0.2),
                    width: 1,
                  ),
                  color: Colors.white.withOpacity(0.9),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 9),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: titleColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 30,
                    color: titleColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Kanit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
