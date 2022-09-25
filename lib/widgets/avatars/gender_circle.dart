import 'package:flutter/material.dart';

class GenderCircle extends StatelessWidget {
  const GenderCircle({Key? key, required this.genderIcon}) : super(key: key);
  final IconData genderIcon;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 84,
      left: 98,
      child: Container(
        height: 43,
        width: 43,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          genderIcon,
          size: 32,
        ),
      ),
    );
  }
}