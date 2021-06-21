import 'package:flutter/material.dart';

bool isNumeric(String value) {
  if (value.isEmpty) return false;
  final n = num.tryParse(value);
  return (n == null) ? false : true;
}

void showAlertMessage(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        'Wrong User/Password',
      ),
      content: Text(
        message,
      ),
      actions: [
        FlatButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Ok'),
        ),
      ],
    ),
  );
}
