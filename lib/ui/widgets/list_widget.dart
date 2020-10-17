import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:taskbuddies/app/locator.dart';
import 'package:taskbuddies/models/todo_list.dart';
import 'package:taskbuddies/ui/views/list_view/list_view_model.dart';
import 'package:taskbuddies/ui/widgets/custom_icons.dart';
import 'package:taskbuddies/ui/widgets/helpers.dart';

class ListContainer extends StatefulWidget {
  final TodoList myList;

  ListContainer(this.myList);

  @override
  _ListContainerState createState() => _ListContainerState();
}

class _ListContainerState extends State<ListContainer> {
  addTodoToWidget() {
    List<TaskTile> tiles = [];
    widget.myList.incomplete.forEach((element) {
      tiles.add(TaskTile(
        todo: element,
        action: () =>
            locator<TodoListViewModel>().completeTask(element, widget.myList),
      ));
    });
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
        child: ExpansionTileCard(
          baseColor: Colors.grey[100],
          borderRadius: BorderRadius.circular(0),
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
              children: addTodoToWidget(),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                loveIcon(),
                mediumHorizontalSpace(),
                commentIcon(),
                mediumHorizontalSpace(),
                IconButton(
                  icon: Icon(Icons.add_circle),
                  color: Colors.blue,
                  onPressed: () {
                    locator<TodoListViewModel>().addItem(widget.myList);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.cancel_rounded),
                  color: Colors.red,
                  onPressed: () =>
                      locator<TodoListViewModel>().deleteList(widget.myList),
                ),
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
  final Function action;

  TaskTile({this.todo, this.action});

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: widget.action,
            color: Colors.green,
          ),
          largeHorizontalSpace(),
          Text('${widget.todo.item}')
        ],
      ),
    );
  }
}
