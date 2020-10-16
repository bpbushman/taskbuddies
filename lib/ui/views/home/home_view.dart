import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:taskbuddies/managers/bottom_sheet_manager.dart';
import 'package:taskbuddies/ui/views/list_view/list_view.dart';
//import 'package:taskbuddies/ui/widgets/constants.dart';
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
                    automaticallyImplyLeading: false,
                    title: Text('TASKBUDDIES'),
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    actions: [
                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () => model.runSearch(),
                      )
                    ],
                  ),
                  backgroundColor: Colors.purple,
                  bottomNavigationBar: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.black, width: 2))),
                    height: 58,
                    child: BottomNavigationBar(
                      backgroundColor: Colors.yellow[50],
                      iconSize: 22,
                      showUnselectedLabels: false,
                      showSelectedLabels: false,
                      type: BottomNavigationBarType.fixed,
                      currentIndex: model.currentIndex,
                      onTap: model.setIndex,
                      items: [
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home),
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
