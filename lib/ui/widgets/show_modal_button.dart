import 'package:flutter/material.dart';
import 'package:taskbuddies/app/locator.dart';
import 'package:taskbuddies/models/todo_list.dart';
import 'package:taskbuddies/ui/views/list_view/list_view_model.dart';
import 'package:taskbuddies/ui/widgets/helpers.dart';

class MyActionButton extends StatefulWidget {
  final TodoList todoList;

  MyActionButton({this.todoList});

  @override
  _MyActionButtonState createState() => _MyActionButtonState();
}

class _MyActionButtonState extends State<MyActionButton> {
  TextEditingController myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return IconButton(
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.all(4),
      icon: Icon(Icons.add_box),
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: Colors.white,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          context: context,
          builder: (context) => Container(
            height: 384,
            child: Column(
              children: [
                mediumVertSpace(),
                Container(
                  width: 320,
                  child: TextFormField(
                    autofocus: true,
                    controller: myController,
                    decoration: InputDecoration(
                      labelText: 'Add a new task',
                      focusColor: Colors.grey[200],
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                RaisedButton(
                  color: Colors.black26,
                  onPressed: () {
                    widget.todoList.addNewItem(myController.text);
                    myController.clear();
                    locator<TodoListViewModel>().notifyListeners();
                    Navigator.pop(context);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}