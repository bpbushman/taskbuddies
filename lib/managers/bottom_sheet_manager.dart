import 'package:flutter/material.dart';
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

  _showBottomSheet(SheetRequest request) {
    bool isTask = request.listTaskToggle;

    showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: pixelBorderProps(),
      context: context,
      builder: (context) => Container(
        height: isTask ? 400 : 440,
        child: Column(
          children: [
            isTask
                ? mediumVertSpace()
                : titleTextField(titleController, request.title),
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
      ),
    );
  }
}
