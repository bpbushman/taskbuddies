import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:taskbuddies/ui/views/signup/signup_view_model.dart';
import 'package:taskbuddies/ui/widgets/helpers.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _password;
  String _email;
  String _username;

  formDecoration(String label) {
    return InputDecoration(
      labelText: label,
      fillColor: Colors.grey[100],
      filled: true,
      border: OutlineInputBorder(
          //borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SignupViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Padding(
            padding: EdgeInsets.fromLTRB(24, 40, 24, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Signup',
                      style:
                          TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                    ),
                  ),
                  largeVertSpace(),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: formDecoration('user name'),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'user name is required';
                            }
                            return null;
                          },
                          onSaved: (value) => _username = value,
                        ),
                        mediumVertSpace(),
                        TextFormField(
                          decoration: formDecoration('email'),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'email is required';
                            }
                            return null;
                          },
                          onSaved: (value) => _email = value,
                        ),
                        mediumVertSpace(),
                        TextFormField(
                          decoration: formDecoration('password'),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'password is required';
                            }
                            return null;
                          },
                          onSaved: (value) => _password = value,
                        ),
                        largeVertSpace(),
                        RaisedButton(
                            child: Text('submit'),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                model.signUp(_email, _password, _username);
                                print(_username);
                                return null;
                              }
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
