import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:taskbuddies/models/user.dart';

//import 'package:taskbuddies/app/locator.dart';
//import 'package:taskbuddies/services/authentication_service.dart';
@lazySingleton
class BuddyService {
  final CollectionReference _userRef = Firestore.instance.collection("users");

  Future handleSearch(String query) async {
    try {
      var users = await _userRef
          .where("username", isGreaterThanOrEqualTo: query)
          .getDocuments()
          .then((value) {
        if (value.documents.isEmpty) {
          return [];
        }
        return value.documents.map((e) {
          return User.fromData(e.data);
        }).toList();
      });
      return users;
    } catch (e) {
      return e.toString();
    }
  }
}
