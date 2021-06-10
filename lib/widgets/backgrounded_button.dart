import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class BackgroundedButton extends StatelessWidget {
  final String text;
  final String image;
  final VoidCallback onTap;

  const BackgroundedButton({
    Key? key,
    required this.text,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: buttonHeight,
      child: Material(
        elevation: buttonElevation,
        borderRadius: BorderRadius.circular(
          buttonBorderRadius,
        ),
        child: Stack(
          children: [
            Opacity(
              opacity: 0.15,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  buttonBorderRadius,
                ),
                child: Container(
                  width: double.infinity,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: buttonHeight,
              alignment: Alignment.center,
              child: Text(
                text,
                style: customBackgroundedButtonTextSyle,
              ),
            ),
            Positioned.fill(
              child: Material(
                borderRadius: BorderRadius.circular(
                  buttonBorderRadius,
                ),
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(
                    buttonBorderRadius,
                  ),
                  onTap: onTap,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
