import 'package:stacked/stacked.dart';
import 'package:taskbuddies/app/locator.dart';
import 'package:taskbuddies/models/buddy_request.dart';
import 'package:taskbuddies/services/authentication_service.dart';
import 'package:taskbuddies/services/buddy_services.dart';

class NotificationsViewModel extends BaseViewModel {
  final BuddyService _buddyService = locator<BuddyService>();
  final AuthenticationService _authService = locator<AuthenticationService>();
  List<BuddyRequest> _buddyRequests = [];
  List<BuddyRequest> get buddyRequests => _buddyRequests;

  bool areRequestsAvailable() {
    return _buddyRequests.isEmpty;
  }

  void listenForBuddyRequests() {
    print(_authService.currentUser.username);
    _buddyService.listenToRequests().listen((event) {
      if (event != null && event.length > 0) {
        _buddyRequests = event;
        notifyListeners();
        print('${_buddyRequests[0].senderUserName}');
      }
    });
  }
}
