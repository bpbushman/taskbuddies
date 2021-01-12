import 'package:flutter/material.dart';
import 'package:pixel_border/pixel_border.dart';
import 'package:stacked/stacked.dart';
import 'package:taskbuddies/app/locator.dart';
import 'package:taskbuddies/managers/bottom_sheet_manager.dart';
import 'package:taskbuddies/ui/views/feed/feed_view.dart';
import 'package:taskbuddies/ui/views/list_view/list_view.dart';
import 'package:taskbuddies/ui/views/list_view/list_view_model.dart';
import 'package:taskbuddies/ui/views/notifications/notifications_view.dart';
import 'package:taskbuddies/ui/views/profile/profile_view.dart';
import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return TodoListView();
      case 1:
        return ProfileView();
      case 2:
        return NotificationsView();
      case 3:
        return FeedView();
      default:
        return TodoListView();
    }
  }

  ImageIcon globeIcon() {
    return ImageIcon(
      AssetImage('assets/icons/globe.png'),
      size: 24,
    );
  }

  ImageIcon homeIcon() {
    return ImageIcon(
      AssetImage('assets/icons/home.png'),
      size: 24,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text(
                  'TASKBUDDIES',
                  textAlign: TextAlign.left,
                ),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                actions: [
                  IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.lightGreen,
                    onPressed: () => model.searchForUsers(),
                  )
                ],
              ),
              backgroundColor: Colors.purple,
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.grey[300],
                iconSize: 24,
                showUnselectedLabels: false,
                showSelectedLabels: false,
                type: BottomNavigationBarType.fixed,
                currentIndex: model.currentIndex,
                onTap: model.setIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: homeIcon(),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'profile',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.notifications),
                    label: 'notifications',
                  ),
                  BottomNavigationBarItem(
                    icon: globeIcon(),
                    label: 'feed',
                  ),
                ],
              ),
              body: BottomSheetManager(
                child: getViewForIndex(model.currentIndex),
              ),
              floatingActionButton: RaisedButton(
                  color: Colors.black26,
                  onPressed: () {
                    locator<TodoListViewModel>().addNewList();
                  },
                  shape: PixelBorder(
                      borderRadius: BorderRadius.circular(8), pixelSize: 4),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  )),
            ),
        viewModelBuilder: () => HomeViewModel());
  }
}
