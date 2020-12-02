import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:taskbuddies/app/locator.dart';
import 'package:taskbuddies/models/todo_list.dart';
import 'package:taskbuddies/models/user.dart';
import 'package:taskbuddies/services/authentication_service.dart';
import 'package:taskbuddies/services/firestore_service.dart';

class FeedViewModel extends BaseViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  List<TodoList> _feedLists = [];
  List<TodoList> get feedLists => _feedLists;

  Future loadUserLists() async {
    print('ive been fired');
    User user = _authenticationService.currentUser;
    var result = await _firestoreService.getFeedLists(user);
    print(result);
    if (result is String) {
      _dialogService.showDialog(
          title: 'Error loading lists', description: "$result");
    }
    _feedLists = result;
    notifyListeners();
  }
}
