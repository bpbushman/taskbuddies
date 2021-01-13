import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:taskbuddies/ui/views/profile/profile_view_model.dart';
import 'package:taskbuddies/ui/widgets/helpers.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onModelReady: (model) => model.fetchCounts(),
      builder: (context, model, child) => Column(
        children: [
          Text(
            'Hello,',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          smallVertSpace(),
          Text(model.userName),
          largeVertSpace(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Buddies: ${model.buddyCount}'),
              mediumHorizontalSpace(),
              Text('Lists: ${model.listCount}'),
            ],
          ),
          largeVertSpace(),
          Center(
            child: RaisedButton(
              child: Text('Sign Out'),
              onPressed: () => model.signOut(),
            ),
          ),
        ],
      ),
      viewModelBuilder: () => ProfileViewModel(),
    );
  }
}
