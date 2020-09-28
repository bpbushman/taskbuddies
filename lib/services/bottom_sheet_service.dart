import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:taskbuddies/models/sheet_request.dart';

@lazySingleton
class BottomSheetService {
  Function(SheetRequest) _bottomSheetListener;
  Completer<SheetResponse> _bottomSheetCompleter;

  void registerBottomSheetListener(Function(SheetRequest) bottomSheetListener) {
    _bottomSheetListener = bottomSheetListener;
  }

  Future<SheetResponse> showBottomSheet(
      {String description,
      String title,
      String buttonTitle = 'ok',
      bool toggle}) {
    _bottomSheetCompleter = Completer<SheetResponse>();
    _bottomSheetListener(SheetRequest(
        title: title,
        description: description,
        buttonTitle: buttonTitle,
        listTaskToggle: toggle));
    return _bottomSheetCompleter.future;
  }

  void bottomSheetComplete(SheetResponse response) {
    _bottomSheetCompleter.complete(response);
    _bottomSheetCompleter = null;
  }
}
