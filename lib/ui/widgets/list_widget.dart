import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:taskbuddies/models/todo_list.dart';
import 'package:taskbuddies/ui/widgets/custom_icons.dart';
import 'package:taskbuddies/ui/widgets/helpers.dart';
import 'package:taskbuddies/ui/widgets/show_modal_button.dart';

class ListContainer extends StatefulWidget {
  final TodoList myList;

  ListContainer(this.myList);

  @override
  _ListContainerState createState() => _ListContainerState();
}

class _ListContainerState extends State<ListContainer> {
  Expanded listBuilder(TodoList list, context) {
    return Expanded(child: ListView.builder(itemBuilder: null));
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
              Text('    ${widget.myList.isListComplete}'),
              IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      widget.myList.isListComplete =
                          !widget.myList.isListComplete;
                    });
                  }),
            ],
          ),
          subtitle: Text(widget.myList.description),
          children: [
            Text('one'),
            Text('two'),
            Text('three'),
            Text('four'),
            Text('five'),
            Text('one'),
            Text('two'),
            Text('three'),
            Text('four'),
            Text('five'),
            //smallVertSpace(),
            //Divider(height: 0.0),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                loveIcon(),
                mediumHorizontalSpace(),
                commentIcon(),
                mediumHorizontalSpace(),
                MyActionButton()
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TaskTile extends StatefulWidget {
  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
