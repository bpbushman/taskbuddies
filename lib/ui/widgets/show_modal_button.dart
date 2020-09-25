import 'package:flutter/material.dart';

class MyActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      //iconSize: 18,
      padding: EdgeInsets.all(4),
      icon: Icon(Icons.add_box),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) => Container(
                  color: Colors.red,
                ));
      },
    );
  }
}
