import 'package:stacked/stacked.dart';
import 'package:taskbuddies/app/locator.dart';
import 'package:taskbuddies/services/authentication_service.dart';
import 'package:taskbuddies/services/buddy_services.dart';
import 'package:taskbuddies/services/firestore_service.dart';

class ProfileViewModel extends BaseViewModel {
  final AuthenticationService authService = locator<AuthenticationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final BuddyService _buddyService = locator<BuddyService>();

  int _listCount;
  int get listCount => _listCount;

  int _buddyCount;
  int get buddyCount => _buddyCount;

  void _fetchListCount() async {
    var result =
        await _firestoreService.getUserListCount(authService.currentUser);
    if (result is String) {
      print(result);
    } else {
      _listCount = result;
      notifyListeners();
    }
  }

  void _fetchBuddyCount() async {
    var result =
        await _buddyService.getUserFollowerCount(authService.currentUser);
    if (result is String) {
      print(result);
    } else {
      _buddyCount = result;
      notifyListeners();
    }
  }

  void fetchCounts() {
    _fetchBuddyCount();
    _fetchListCount();
    //notifyListeners();
  }
}
