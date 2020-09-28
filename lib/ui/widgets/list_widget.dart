import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:taskbuddies/app/locator.dart';
import 'package:taskbuddies/models/todo_list.dart';
import 'package:taskbuddies/ui/views/list_view/list_view_model.dart';
import 'package:taskbuddies/ui/widgets/custom_icons.dart';
import 'package:taskbuddies/ui/widgets/helpers.dart';
//import 'package:taskbuddies/ui/widgets/show_modal_button.dart';

class ListContainer extends StatefulWidget {
  final TodoList myList;

  ListContainer(this.myList);

  @override
  _ListContainerState createState() => _ListContainerState();
}

class _ListContainerState extends State<ListContainer> {
  addTodoToWidget(List<Todo> todo) {
    List<TaskTile> tiles = [];
    todo.forEach((element) {
      tiles.add(TaskTile(todo: element));
    });
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
        child: ExpansionTileCard(
          borderRadius: BorderRadius.circular(12),
          leading: CircleAvatar(
            child: Text('${widget.myList.incomplete.length}'),
          ),
          title: Row(
            children: [
              Text(widget.myList.title),
            ],
          ),
          subtitle: Text(widget.myList.description),
          children: [
            ListView(
              shrinkWrap: true,
              children: addTodoToWidget(widget.myList.incomplete),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                loveIcon(),
                mediumHorizontalSpace(),
                commentIcon(),
                mediumHorizontalSpace(),
                IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () async {
                      var newItem =
                          await locator<TodoListViewModel>().addItem();
                      widget.myList.addNewItem(newItem);
                      locator<TodoListViewModel>().notifyListeners();
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TaskTile extends StatefulWidget {
  final Todo todo;

  TaskTile({this.todo});

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(icon: Icon(Icons.check), onPressed: null),
          largeHorizontalSpace(),
          Text('${widget.todo.item}')
        ],
      ),
    );
  }
}
