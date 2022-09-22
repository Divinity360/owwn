import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/utils/colors.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(backgroundColor: AppColors.white),
        ));
  }
}
