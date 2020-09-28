import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:taskbuddies/services/managers/bottom_sheet_manager.dart';
import 'package:taskbuddies/ui/views/list_view/list_view.dart';
import 'package:taskbuddies/ui/widgets/constants.dart';
import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return TodoListView();
      case 1:
        return DummyTwo();
      case 2:
        return DummyThree();
      default:
        return TodoListView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        builder: (context, model, child) => SafeArea(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Scaffold(
                  appBar: AppBar(
                    title: mainTitle(),
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    actions: [
                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: null,
                      )
                    ],
                  ),
                  backgroundColor: Colors.grey[300],
                  bottomNavigationBar: SizedBox(
                    height: 55,
                    child: BottomNavigationBar(
                      iconSize: 24,
                      showUnselectedLabels: false,
                      showSelectedLabels: false,
                      type: BottomNavigationBarType.fixed,
                      currentIndex: model.currentIndex,
                      onTap: model.setIndex,
                      items: [
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home),
                          title: Text('Home'),
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.notifications),
                          title: Text('notifications'),
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.list),
                          title: Text('feed'),
                        ),
                      ],
                    ),
                  ),
                  body: BottomSheetManager(
                    child: getViewForIndex(model.currentIndex),
                  ),
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
