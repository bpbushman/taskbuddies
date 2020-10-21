import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:taskbuddies/app/locator.dart';
import 'package:taskbuddies/models/user.dart';
import 'package:taskbuddies/services/bottom_sheet_service.dart';
import 'package:taskbuddies/services/buddy_services.dart';

@lazySingleton
class HomeViewModel extends IndexTrackingViewModel {
  BuddyService _buddyService = locator<BuddyService>();
  DialogService _dialogService = locator<DialogService>();
  BottomSheetService _bottomSheetService = locator<BottomSheetService>();

  List<User> _users = [];

  void sendBuddyRequest(User user) async {
    var result = await _buddyService.handleBuddyRequest(user);
    if (result is String) {
      _dialogService.showDialog(
        title: 'Error sending request',
        description: result,
      );
    }
  }

  void searchForUsers() async {
    var search = await _bottomSheetService.showBottomSheet(
      description: 'Search for a buddy',
    );
    var result = await _buddyService.handleSearch(search.fieldOne);
    if (result is String) {
      _dialogService.showDialog(
          title: 'Could not find Buddies', description: result);
    } else if (result is List<User>) {
      _users = result;
      _bottomSheetService.showBottomSheet(
          list: _users, sheetType: 'searchResult');
      _users.forEach((element) {
        print(element.username);
      });
    }
  }
}
