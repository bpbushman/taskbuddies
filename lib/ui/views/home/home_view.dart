import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:taskbuddies/ui/views/list_view/list_view.dart';
import 'package:taskbuddies/ui/widgets/constants.dart';
import 'package:taskbuddies/ui/widgets/custom_icons.dart';
import 'package:taskbuddies/ui/widgets/helpers.dart';
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
                    centerTitle: true,
                    backgroundColor: Colors.grey[300],
                    elevation: 0.0,
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
                  body: getViewForIndex(model.currentIndex),
                ),
              ),
            ),
        viewModelBuilder: () => HomeViewModel());
  }
}

class DummyOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('hello from dummy one');
    return Center(
      child: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: ExpansionTileCard(
            borderRadius: BorderRadius.circular(12),
            leading: CircleAvatar(
              child: Text('B'),
            ),
            title: Text('Some title'),
            subtitle: Text('u/dogBuddy'),
            children: [
              Text('one'),
              Text('two'),
              Text('three'),
              Text('four'),
              Text('five'),
              smallVertSpace(),
              Divider(height: 0.0),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  loveIcon(),
                  mediumHorizontalSpace(),
                  commentIcon(),
                  mediumHorizontalSpace(),
                  addBuddyIcon()
                ],
              )
            ],
          ),
        ),
      ),
    );
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
