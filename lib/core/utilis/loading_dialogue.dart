import 'package:flutter/material.dart';

showLoadingDialogue(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: CircularProgressIndicator(),
        );
      });
}
