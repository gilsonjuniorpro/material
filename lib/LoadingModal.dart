import 'package:flutter/material.dart';

class LoadingModal extends StatelessWidget {
  final String loadingText;

  LoadingModal({this.loadingText = "Loading..."});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Use minimum space necessary
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text(loadingText),
          ],
        ),
      ),
    );
  }
}

