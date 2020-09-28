import 'package:flutter/material.dart';
import 'package:taskbuddies/app/locator.dart';
import 'package:taskbuddies/models/sheet_request.dart';
import 'package:taskbuddies/services/bottom_sheet_service.dart';
import 'package:taskbuddies/ui/widgets/helpers.dart';

class BottomSheetManager extends StatefulWidget {
  final Widget child;
  BottomSheetManager({Key key, this.child}) : super(key: key);

  _BottomSheetManagerState createState() => _BottomSheetManagerState();
}

class _BottomSheetManagerState extends State<BottomSheetManager> {
  BottomSheetService _sheetService = locator<BottomSheetService>();
  TextEditingController myController = TextEditingController();

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
    showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      context: context,
      builder: (context) => Container(
        height: 384,
        child: Column(
          children: [
            mediumVertSpace(),
            Container(
              width: 320,
              child: TextFormField(
                autofocus: true,
                controller: myController,
                decoration: InputDecoration(
                  labelText: request.description,
                  focusColor: Colors.grey[200],
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
            RaisedButton(
              color: Colors.black26,
              onPressed: () {
                _sheetService.bottomSheetComplete(SheetResponse(
                  confirmed: true,
                  fieldOne: myController.text,
                ));
                myController.clear();
                Navigator.of(context).pop();
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Text(
                request.buttonTitle,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
