import 'package:flutter/material.dart';
import 'package:taskbuddies/models/user.dart';
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
        Text('Buddies'),
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

Widget userTile(User user) {
  return ListTile(
    //leading: CircleAvatar(),
    title: Text(user.username),
    subtitle: Text(
      user.email,
      style: TextStyle(fontSize: 11),
    ),
    trailing: RaisedButton(
      shape: pixelBorderProps(),
      color: Colors.blue,
      onPressed: null,
      child: Text(
        'Add Buddy!',
        style: TextStyle(
          fontSize: 12,
        ),
      ),
    ),
  );
}
