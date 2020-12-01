import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:taskbuddies/models/todo_list.dart';
import 'package:taskbuddies/ui/views/feed/feed_view_model.dart';
import 'package:taskbuddies/ui/widgets/feed_post.dart';

class FeedView extends StatelessWidget {
  @override
  Widget build(BuildContext build) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => FeedViewModel(),
      builder: (context, model, child) => Container(
        child: FeedPost(
            post: TodoList(
          title: 'Some List',
          description: 'some very good description',
          complete: [],
          incomplete: [],
          isListComplete: false,
        )),
      ),
    );
  }
}
