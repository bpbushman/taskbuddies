import 'package:flutter/foundation.dart';
import 'package:taskbuddies/models/user.dart';

class SheetRequest {
  final String title;
  final String description;
  final String buttonTitle;
  final bool listTaskToggle;
  final String sheetType;
  final List<User> list;

  SheetRequest({
    this.list,
    this.sheetType,
    this.listTaskToggle,
    this.title,
    @required this.description,
    @required this.buttonTitle,
  });
}

class SheetResponse {
  final String fieldOne;
  final String fieldTwo;
  final bool confirmed;

  SheetResponse({this.fieldOne, this.fieldTwo, this.confirmed});
}
