import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:taskbuddies/app/locator.dart';
import 'package:taskbuddies/models/buddy_request.dart';
import 'package:taskbuddies/models/user.dart';
import 'package:taskbuddies/services/authentication_service.dart';

@lazySingleton
class BuddyService {
  final AuthenticationService _authService = locator<AuthenticationService>();
  final CollectionReference _userRef = Firestore.instance.collection("users");
  final CollectionReference _followerRef =
      Firestore.instance.collection('followers');
  final CollectionReference _followingRef =
      Firestore.instance.collection('following');
  final CollectionReference _requestRef =
      Firestore.instance.collection("requests");
  final StreamController<List<BuddyRequest>> _requestController =
      StreamController<List<BuddyRequest>>.broadcast();

  Stream listenToRequests() {
    String uid = _authService.currentUser.uid;
    _requestRef
        .document(uid)
        .collection("UserRequest")
        .snapshots()
        .listen((event) {
      if (event.documents.isNotEmpty) {
        var requests = event.documents
            .map((e) => BuddyRequest.fromData(e.data))
            .where((element) => element.senderUid != null)
            .toList();
        _requestController.add(requests);
      }
    });
    return _requestController.stream;
  }

  Future handleBuddyResponse(BuddyRequest request) async {
    User currentUser = _authService.currentUser;
    if (request.accepted) {
      try {
        await _followingRef
            .document(currentUser.uid)
            .collection('userFollowers')
            .document(request.senderUid)
            .setData({'user': request.senderUid});
        await _followerRef
            .document(request.senderUid)
            .collection('following')
            .document(currentUser.uid)
            .setData({'user': currentUser.uid});
        _deleteRequest(request);
        await _followerRef
            .document(currentUser.uid)
            .collection('userFollowers')
            .document(request.senderUid)
            .setData({'user': request.senderUid});
        await _followingRef
            .document(request.senderUid)
            .collection('following')
            .document(currentUser.uid)
            .setData({'user': currentUser.uid});
        _deleteRequest(request);
        return true;
      } catch (e) {
        return e.message.toString();
      }
    }
  }

  Future _deleteRequest(BuddyRequest request) async {
    User currentUser = _authService.currentUser;
    try {
      _requestRef
          .document(currentUser.uid)
          .collection('UserRequest')
          .document(request.senderUid)
          .delete();
      return true;
    } catch (e) {
      return e.message.toString();
    }
  }

  Future handleBuddyRequest(User user) async {
    User currentUser = _authService.currentUser;
    print(currentUser.username);
    BuddyRequest newRequest = BuddyRequest(
        message: 'this is a new request',
        senderUid: currentUser.uid,
        senderUserName: currentUser.username);
    try {
      var result = await _requestRef
          .document(user.uid)
          .collection('UserRequest')
          .document(currentUser.uid)
          .setData(newRequest.toJson());
      return result;
    } catch (e) {
      return e.message.toString();
    }
  }

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
