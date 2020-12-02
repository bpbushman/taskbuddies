import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:taskbuddies/models/todo_list.dart';
import 'package:taskbuddies/ui/views/feed/feed_view_model.dart';
import 'package:taskbuddies/ui/widgets/feed_post.dart';

class FeedView extends StatelessWidget {
  List addListToWidget(List<TodoList> todo) {
    List<FeedPost> listWidget = [];
    todo.forEach((element) {
      listWidget.add(FeedPost(post: element));
    });
    return listWidget;
  }

  @override
  Widget build(BuildContext build) {
    return ViewModelBuilder.reactive(
      onModelReady: (model) => model.loadUserLists(),
      viewModelBuilder: () => FeedViewModel(),
      builder: (context, model, child) => Container(
        child: model.feedLists.isEmpty
            ? Text(' no posts')
            : ListView(
                children: addListToWidget(model.feedLists),
              ),
      ),
    );
  }
}
