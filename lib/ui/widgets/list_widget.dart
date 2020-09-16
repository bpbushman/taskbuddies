import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:taskbuddies/models/todo_list.dart';
import 'package:taskbuddies/ui/widgets/custom_icons.dart';
import 'package:taskbuddies/ui/widgets/helpers.dart';

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
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: ExpansionTileCard(
          borderRadius: BorderRadius.circular(12),
          leading: CircleAvatar(
            child: Text('${widget.myList.incomplete.length}'),
          ),
          title: Text(widget.myList.title),
          subtitle: Text(widget.myList.description),
          children: [
            Text('one'),
            Text('two'),
            Text('three'),
            Text('four'),
            Text('five'),
            smallVertSpace(),
            Divider(height: 0.0),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                loveIcon(),
                mediumHorizontalSpace(),
                commentIcon(),
                mediumHorizontalSpace(),
                Icon(Icons.add_circle_outline),
              ],
            )
          ],
        ),
      ),
    );
  }
}
