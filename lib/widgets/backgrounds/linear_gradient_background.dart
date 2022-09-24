import 'package:flutter/material.dart';

class LinearGradientBackground extends StatelessWidget {
  const LinearGradientBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black,
            Colors.transparent,
          ],
          stops: [.8, 1],
        ),
      ),
      width: _screenWidth,
      child: child,
    );
  }
}
