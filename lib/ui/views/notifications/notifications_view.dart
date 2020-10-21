import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:taskbuddies/models/buddy_request.dart';
import 'package:taskbuddies/ui/views/notifications/notifications_view_model.dart';
import 'package:taskbuddies/ui/widgets/helpers.dart';

class NotificationsView extends StatelessWidget {
  requestGenerator(List<BuddyRequest> requests) {
    List<Container> requestTiles = [];
    requests.forEach((element) {
      requestTiles.add(requestTile(element));
    });
    return requestTiles;
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onModelReady: (model) => model.listenForBuddyRequests(),
      builder: (context, model, child) => Container(
        constraints: BoxConstraints(maxHeight: 600),
        child: model.areRequestsAvailable()
            ? Text("No requests")
            : ListView(
                children: requestGenerator(model.buddyRequests),
              ),
      ),
      viewModelBuilder: () => NotificationsViewModel(),
    );
  }
}

Container requestTile(BuddyRequest request) {
  return Container(
    child: Padding(
      padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
      child: ListTile(
        tileColor: Colors.grey[200],
        title: Text('${request.senderUserName} wants to be your buddy'),
        trailing: RaisedButton(
          onPressed: () => print('accepted!'),
          shape: pixelBorderProps(),
          color: Colors.blue,
          child: Text('accept!'),
        ),
      ),
    ),
  );
}
