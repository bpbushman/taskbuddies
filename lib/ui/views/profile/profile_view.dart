import 'package:flutter/material.dart';
import 'package:taskbuddies/app/locator.dart';
import 'package:taskbuddies/services/authentication_service.dart';

// ignore: must_be_immutable
class ProfileView extends StatelessWidget {
  AuthenticationService authService = locator<AuthenticationService>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('HELLO, ${authService.currentUser.username}'),
        Divider(),
        Center(
          child: GestureDetector(
            child: Text('LOG OUT'),
            onTap: () => authService.signout(),
          ),
        )
      ],
    );
  }
}
