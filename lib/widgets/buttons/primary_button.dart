import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/utils/colors.dart';
import 'package:owwn_coding_challenge/widgets/loader/app_loader.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final bool isLoading;

  const PrimaryButton(
      {Key? key, required this.text, this.onTap, this.isLoading = false,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      height: 69,
      child: isLoading
          ? const Center(child: AppLoader(),)
          : TextButton(
              onPressed: onTap,
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),
                backgroundColor: AppColors.blueBonnet,
              ),
              child: Text(text, style: _textTheme.button),
            ),
    );
  }
}
