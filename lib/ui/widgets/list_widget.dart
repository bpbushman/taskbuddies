import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:taskbuddies/ui/widgets/custom_icons.dart';
import 'package:taskbuddies/ui/widgets/helpers.dart';

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
                  Icon(Icons.add_circle_outline),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
