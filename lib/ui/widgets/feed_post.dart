import 'package:flutter/material.dart';
import 'package:pixel_border/pixel_border.dart';
import 'package:taskbuddies/models/todo_list.dart';

import 'custom_icons.dart';
import 'helpers.dart';

class FeedPost extends StatelessWidget {
  final TodoList post;

  FeedPost({
    this.post,
  });

  PixelBorder pixelShape() {
    return PixelBorder(
      borderRadius: BorderRadius.all(Radius.circular(9)),
      pixelSize: 3,
      borderColor: Colors.grey,
      style: BorderStyle.none,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
      child: Card(
        elevation: 3,
        shape: pixelShape(),
        child: Column(
          children: [
            ListTile(
              title: Text(post.owner),
              subtitle: Text('${post.description} ${post.timeStamp}'),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                loveIcon(),
                mediumHorizontalSpace(),
                commentIcon(),
                mediumHorizontalSpace(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
