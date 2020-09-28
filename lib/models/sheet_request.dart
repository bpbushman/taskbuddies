import 'package:flutter/foundation.dart';

class SheetRequest {
  final String description;
  final String buttonTitle;

  SheetRequest({
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
