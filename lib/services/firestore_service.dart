import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:taskbuddies/models/todo_list.dart';
import 'package:taskbuddies/models/user.dart';

@lazySingleton
class FirestoreService {
  final CollectionReference _userRef = Firestore.instance.collection("users");
  final CollectionReference _listRef = Firestore.instance.collection("lists");
//getting users and creating users
  Future createUser(User user) async {
    try {
      await _userRef.document(user.uid).setData(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _userRef.document(uid).get();
      return User.fromData(userData.data);
    } catch (e) {
      return e.message;
    }
  }

  //methods to send and get lists from firebase
  Future createList(TodoList todoList, User user) async {
    try {
      await _listRef
          .document(user.uid)
          .collection('userLists')
          .document(todoList.listId)
          .setData(todoList.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future createTask(TodoList list) async {
    try {
      await _listRef
          .document(list.ownerId)
          .collection('userLists')
          .document(list.listId)
          .updateData({"incomplete": list.newListOfMaps(list.incomplete)});
    } catch (e) {
      print(e);
      print('list id is ${list.listId}');
      return e.message;
    }
  }
}
