import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:taskbuddies/app/locator.dart';
import 'package:taskbuddies/models/buddy_request.dart';
import 'package:taskbuddies/services/authentication_service.dart';
import 'package:taskbuddies/services/buddy_services.dart';

@lazySingleton
class NotificationsViewModel extends BaseViewModel {
  final BuddyService _buddyService = locator<BuddyService>();
  final AuthenticationService _authService = locator<AuthenticationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  List<BuddyRequest> _buddyRequests = [];
  List<BuddyRequest> get buddyRequests => _buddyRequests;

  bool areRequestsAvailable() {
    return _buddyRequests.isEmpty;
  }

  void acceptRequest(BuddyRequest request) async {
    var result = _buddyService.handleBuddyResponse(request);
    if (result is String) {
      print(result);
    }
    notifyListeners();
    _snackbarService.showSnackbar(
        message: 'You and ${request.senderUserName} are Buddies!',
        duration: Duration(seconds: 3));
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
