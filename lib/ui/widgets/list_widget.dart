import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:taskbuddies/app/locator.dart';
import 'package:taskbuddies/models/todo_list.dart';
import 'package:taskbuddies/ui/views/list_view/list_view_model.dart';
import 'package:taskbuddies/ui/widgets/custom_icons.dart';
import 'package:taskbuddies/ui/widgets/helpers.dart';
import 'package:taskbuddies/ui/widgets/list_header.dart';

class ListContainer extends StatefulWidget {
  final TodoList myList;

  ListContainer(this.myList);

  @override
  _ListContainerState createState() => _ListContainerState();
}

class _ListContainerState extends State<ListContainer> {
  checkIfListIsDone({Widget child}) {
    if (widget.myList.complete.length >= 1 &&
        widget.myList.incomplete.length == 0) {
      return doneGif();
    } else
      return child;
  }

  Widget doneGif() {
    return Column(
      children: [
        Image.asset(
          "assets/gifs/done.gif",
          //height: 75.0,
          //width: 75.0,
        ),
        Text('All tasks completed!')
      ],
    );
  }

  double getIndicatorValue() {
    double a = widget.myList.incomplete.length.toDouble();
    double b = widget.myList.complete.length.toDouble();
    double value;

    if ((a == 0 && b == 0)) return 1;

    value = ((b) / (a + b));
    return value;
  }

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
        child: Column(
          children: [
            listIndicator(getIndicatorValue()),
            ExpansionTileCard(
              leading: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_box_outline_blank,
                        color: Colors.grey,
                      ),
                      Text(
                        '${widget.myList.incomplete.length}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_box_outlined,
                        color: Colors.grey,
                      ),
                      Text(
                        '${widget.myList.complete.length}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              finalPadding: EdgeInsets.symmetric(vertical: 0),
              elevation: 6,
              baseColor: Colors.grey[100],
              borderRadius: BorderRadius.circular(0),
              title: listHeader(
                widget.myList.title,
                widget.myList.description,
              ),
              children: [
                checkIfListIsDone(
                  child: ListView(
                    shrinkWrap: true,
                    children: addTodoToWidget(),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    loveIcon(),
                    mediumHorizontalSpace(),
                    commentIcon(),
                    mediumHorizontalSpace(),
                    IconButton(
                      icon: Icon(Icons.add_circle_outline_sharp),
                      color: Colors.blue,
                      onPressed: () {
                        locator<TodoListViewModel>().addItem(widget.myList);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.cancel_rounded),
                      color: Colors.red,
                      onPressed: () => locator<TodoListViewModel>()
                          .deleteList(widget.myList),
                    ),
                  ],
                )
              ],
            ),
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
      padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: widget.action,
            color: Colors.lightGreen,
          ),
          largeHorizontalSpace(),
          Flexible(child: Text('${widget.todo.item}'))
        ],
      ),
    );
  }
}
