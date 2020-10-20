import 'package:flutter/material.dart';
import 'package:pixel_border/pixel_border.dart';
import 'package:taskbuddies/app/locator.dart';
import 'package:taskbuddies/models/sheet_request.dart';
import 'package:taskbuddies/services/bottom_sheet_service.dart';
import 'package:taskbuddies/ui/widgets/bottom_sheet_widgets.dart';
import 'package:taskbuddies/ui/widgets/helpers.dart';

class BottomSheetManager extends StatefulWidget {
  final Widget child;
  BottomSheetManager({Key key, this.child}) : super(key: key);

  _BottomSheetManagerState createState() => _BottomSheetManagerState();
}

class _BottomSheetManagerState extends State<BottomSheetManager> {
  BottomSheetService _sheetService = locator<BottomSheetService>();
  TextEditingController myController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _sheetService.registerBottomSheetListener(_showBottomSheet);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  Widget _selectSheetType(SheetRequest request) {
    switch (request.sheetType) {
      case 'newList':
        return _newListSheet(request);
      case 'newTask':
        return _newTaskSheet(request);
      case 'searchResult':
        return searchResultsList(request.list);
      default:
        return _newTaskSheet(request);
    }
  }

  Container _newTaskSheet(SheetRequest request) {
    return Container(
      height: 350,
      child: Column(
        children: [
          mediumVertSpace(),
          customTextField(
            myController,
            request.description,
            modalButton(() {
              _sheetService.bottomSheetComplete(SheetResponse(
                confirmed: true,
                fieldOne: myController.text,
                fieldTwo: titleController.text,
              ));
              myController.clear();
              titleController.clear();
              Navigator.of(context).pop();
            }),
          ),
        ],
      ),
    );
  }

  Container _newListSheet(SheetRequest request) {
    return Container(
      height: 410,
      child: Column(
        children: [
          titleTextField(titleController, request.title),
          mediumVertSpace(),
          customTextField(
            myController,
            request.description,
            modalButton(() {
              _sheetService.bottomSheetComplete(SheetResponse(
                confirmed: true,
                fieldOne: myController.text,
                fieldTwo: titleController.text,
              ));
              myController.clear();
              titleController.clear();
              Navigator.of(context).pop();
            }),
          ),
        ],
      ),
    );
  }

  _showBottomSheet(SheetRequest request) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: PixelBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          pixelSize: 5,
          borderColor: Colors.black),
      context: context,
      builder: (context) => _selectSheetType(request),
    );
  }
}
