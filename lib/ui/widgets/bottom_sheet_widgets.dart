import 'package:flutter/material.dart';
import 'package:taskbuddies/app/locator.dart';
import 'package:taskbuddies/models/user.dart';
import 'package:taskbuddies/ui/views/home/home_view_model.dart';
import 'package:taskbuddies/ui/widgets/helpers.dart';

Container titleTextField(TextEditingController text, String title) {
  return Container(
    width: 160,
    child: TextFormField(
      textAlign: TextAlign.center,
      controller: text,
      autofocus: true,
      decoration: InputDecoration(labelText: title),
    ),
  );
}

Container customTextField(
    TextEditingController text, String description, IconButton button) {
  return Container(
    width: 320,
    child: TextFormField(
      autofocus: true,
      controller: text,
      decoration: InputDecoration(
        suffixIcon: button,
        labelText: description,
        focusColor: Colors.grey[200],
        fillColor: Colors.grey,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
          ),
        ),
      ),
    ),
  );
}

IconButton modalButton(Function action) {
  return IconButton(
    icon: Icon(Icons.arrow_upward),
    color: Colors.green,
    onPressed: action,
    tooltip: 'Submit!!',
  );
}

Container searchResultsList(List<User> listOfUsers) {
  List<ListTile> listOfTiles = [];
  listOfUsers.forEach((element) {
    listOfTiles.add(userTile(element));
  });

  return Container(
    height: 400,
    child: Column(
      children: [
        Text(
          'Buddies',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Expanded(
          child: ListView(children: listOfTiles),
        ),
      ],
    ),
  );
}

List<ListTile> userResults(List<User> listOfUsers) {
  List<ListTile> listOfTiles = listOfUsers.map((e) => userTile(e));
  return listOfTiles;
}

/*
  add buddy request needs a reaction or a type
  of confirmation after request is sent
 */
Widget userTile(User user) {
  return ListTile(
    //leading: CircleAvatar(),
    //tileColor: Colors.grey[200],
    title: Text(user.username),
    subtitle: Text(
      user.email,
      style: TextStyle(fontSize: 11),
    ),
    trailing: RaisedButton(
      shape: pixelBorderProps(),
      color: Colors.blue,
      onPressed: () => locator<HomeViewModel>().sendBuddyRequest(user),
      child: Text(
        'Add Buddy!',
        style: TextStyle(
          fontSize: 12,
        ),
      ),
    ),
  );
}
