import 'package:flutter/foundation.dart';

class SheetRequest {
  final String title;
  final String description;
  final String buttonTitle;
  final bool listTaskToggle;
  final String sheetType;

  SheetRequest({
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
