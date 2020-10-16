import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:taskbuddies/app/locator.dart';
import 'package:taskbuddies/models/user.dart';
import 'package:taskbuddies/services/buddy_services.dart';

class HomeViewModel extends IndexTrackingViewModel {
  BuddyService _buddyService = locator<BuddyService>();
  DialogService _dialogService = locator<DialogService>();

  List<User> _users = [];

  void runSearch() async {
    var result = await _buddyService.handleSearch('d');
    if (result is String) {
      _dialogService.showDialog(
          title: 'Could not find Buddies', description: result);
    } else if (result is List<User>) {
      _users = result;

      _users.forEach((element) {
        print(element.username);
      });
      _dialogService.showDialog(
          title: 'Buddies in the wild', description: '${_users[0].username}');
    }
  }
}
