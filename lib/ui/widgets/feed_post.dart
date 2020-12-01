import 'package:flutter/material.dart';
import 'package:pixel_border/pixel_border.dart';
import 'package:taskbuddies/models/todo_list.dart';

class FeedPost extends StatelessWidget {
  final TodoList post;

  FeedPost({
    this.post,
  });

  PixelBorder pixelShape() {
    return PixelBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      pixelSize: 4,
      borderColor: Colors.black,
      style: BorderStyle.none,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
      child: Card(
        shape: pixelShape(),
        child: ListTile(
          title: Text(post.title),
          subtitle: Text(post.description),
        ),
      ),
    );
  }
}
