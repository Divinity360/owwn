import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  final Function()? onTap;

  const StartButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return SizedBox.square(
      dimension: 136,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Colors.white,
                Colors.transparent,
              ],
              stops: [.8, 1],
            ),
          ),
          child: Center(
            child: Text(
              'Press to start',
              style: _textTheme.headline3,
            ),
          ),
        ),
      ),
    );
  }
}
