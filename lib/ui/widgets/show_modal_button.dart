import 'package:flutter/material.dart';

class MyActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.all(4),
      icon: Icon(Icons.add_box),
      onPressed: () {
        showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          context: context,
          builder: (context) => Container(
            height: 96,
            child: Column(),
          ),
        );
      },
    );
  }
}
