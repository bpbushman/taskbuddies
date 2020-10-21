import 'package:flutter/material.dart';
import 'package:pixel_border/pixel_border.dart';
import 'package:stacked/stacked.dart';
import 'package:taskbuddies/app/locator.dart';
import 'package:taskbuddies/managers/bottom_sheet_manager.dart';
import 'package:taskbuddies/ui/views/list_view/list_view.dart';
import 'package:taskbuddies/ui/views/list_view/list_view_model.dart';
import 'package:taskbuddies/ui/views/notifications/notifications_view.dart';
import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return TodoListView();
      case 1:
        return NotificationsView();
      case 2:
        return DummyThree();
      default:
        return TodoListView();
    }
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
                title: Text('TASKBUDDIES'),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                actions: [
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => model.searchForUsers(),
                  )
                ],
              ),
              backgroundColor: Colors.purple,
              bottomNavigationBar: Container(
                height: 58,
                child: BottomNavigationBar(
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
                      icon: Icon(Icons.notifications),
                      label: 'notifications',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.list),
                      label: 'feed',
                    ),
                  ],
                ),
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
                    borderRadius: BorderRadius.circular(20), pixelSize: 5),
                child: Text(
                  'Make a new List',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
        viewModelBuilder: () => HomeViewModel());
  }
}

class DummyTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('hello from dummy two');
    return Center(
      child: Text('notifications'),
    );
  }
}

class DummyThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('hello from dummy three');
    return Center(
      child: Text('announcements'),
    );
  }
}
