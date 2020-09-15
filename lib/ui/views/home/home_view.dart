import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:taskbuddies/models/todo_list.dart';

import 'home_view_model.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController itemController = TextEditingController();

  Padding tile(Todo todo, Function action) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
      child: ListTile(
        leading: IconButton(
          icon: Icon(Icons.check),
          onPressed: action,
        ),
        title: Text(todo.item),
      ),
    );
  }

  Expanded makeList(List<Todo> myList, Function func) {
    return Expanded(
      child: ListView.builder(
        itemCount: myList.length,
        itemBuilder: (BuildContext context, index) {
          return tile(myList[index], func);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        builder: (context, model, child) => Scaffold(
              body: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 320,
                      child: makeList(
                        model.myList.incomplete,
                        () => null,
                      ),
                    ),
                    TextFormField(
                      controller: itemController,
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  if (itemController.text == null) {
                    return null;
                  }
                  model.newItemToList(itemController.text);
                  model.printList();
                  itemController.clear();
                },
              ),
            ),
        viewModelBuilder: () => HomeViewModel());
  }
}
