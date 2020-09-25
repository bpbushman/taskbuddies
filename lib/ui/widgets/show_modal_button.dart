import 'package:flutter/material.dart';
import 'package:taskbuddies/ui/widgets/helpers.dart';

class MyActionButton extends StatefulWidget {
  @override
  _MyActionButtonState createState() => _MyActionButtonState();
}

class _MyActionButtonState extends State<MyActionButton> {
  TextEditingController myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.all(4),
      icon: Icon(Icons.add_box),
      onPressed: () {
        showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          context: context,
          builder: (context) => Container(
            height: 104,
            child: Column(
              children: [
                mediumVertSpace(),
                Container(
                  width: 320,
                  child: TextFormField(
                    controller: myController,
                    decoration: InputDecoration(
                      labelText: 'Add a new task',
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
