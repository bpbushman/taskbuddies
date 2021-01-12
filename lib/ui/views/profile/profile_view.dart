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
          Text(model.authService.currentUser.username),
          largeVertSpace(),
          Text('Buddies: ${model.buddyCount}'),
          smallVertSpace(),
          Text('Lists: ${model.listCount}'),
        ],
      ),
      viewModelBuilder: () => ProfileViewModel(),
    );
  }
}
