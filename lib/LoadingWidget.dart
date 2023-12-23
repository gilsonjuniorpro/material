import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final String loadingText;
  final Color backgroundColor;

  LoadingWidget({this.loadingText = "Loading...", this.backgroundColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // to size the column to fit its children
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 20), // Provide space between the indicator and text
            Text(loadingText), // Configurable text
          ],
        ),
      ),
    );
  }
}
