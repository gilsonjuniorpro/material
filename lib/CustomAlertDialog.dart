import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef OkButtonCallback = void Function();
typedef CancelButtonCallback = void Function();

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final OkButtonCallback? onOkButtonPressed;
  final CancelButtonCallback? onCancelButtonPressed;
  final Color backgroundColor; // Added parameter for background color
  final Color buttonBackgroundColor;
  final Color buttonTextColor;
  final Color titleColor;
  final Color contentColor;
  final double buttonTextSize;
  final String buttonPositiveText;
  final String buttonNegativeText;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.content,
    this.onOkButtonPressed,
    this.onCancelButtonPressed,
    this.backgroundColor = Colors.white, // Default color is white
    this.buttonBackgroundColor = Colors.black,
    this.buttonTextColor = Colors.white,
    this.titleColor = Colors.black,
    this.contentColor = Colors.black,
    this.buttonTextSize = 15.0,
    this.buttonPositiveText = "OK",
    this.buttonNegativeText = "Cancel",
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,  // Use the passed backgroundColor
      title: Text(title, style: TextStyle(color: titleColor)),
      content: Text(content, style: TextStyle(color: contentColor)),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            if(onCancelButtonPressed != null){
              onCancelButtonPressed!();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonBackgroundColor,
            textStyle: TextStyle(
              color: buttonTextColor,
              fontSize: buttonTextSize,
            ),
          ),
          child: Text(buttonNegativeText),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            if(onOkButtonPressed != null){
              onOkButtonPressed!();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonBackgroundColor,
            textStyle: TextStyle(
              color: buttonTextColor,
              fontSize: buttonTextSize,
            ),
          ),
          child: Text(buttonPositiveText),
        ),
      ],
    );
  }
}
