import 'package:flutter/material.dart';

Container titleTextField(TextEditingController text, String title) {
  return Container(
    width: 160,
    child: TextFormField(
      textAlign: TextAlign.center,
      controller: text,
      autofocus: true,
      decoration: InputDecoration(labelText: title),
    ),
  );
}

Container customTextField(
    TextEditingController text, String description, IconButton button) {
  return Container(
    width: 320,
    child: TextFormField(
      autofocus: true,
      controller: text,
      decoration: InputDecoration(
        suffixIcon: button,
        labelText: description,
        focusColor: Colors.grey[200],
        fillColor: Colors.grey,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
          ),
        ),
      ),
    ),
  );
}

IconButton modalButton(Function action) {
  return IconButton(
    icon: Icon(Icons.arrow_upward),
    color: Colors.green,
    onPressed: action,
    tooltip: 'Submit!!',
  );
}
