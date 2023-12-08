import 'package:e_commerce/screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/screens/app_bar.dart';
import 'package:quickalert/quickalert.dart';

class Signup extends StatefulWidget {
  // Signup({super.key});
  State<Signup> createState() => _Signup();
}

class _Signup extends State<Signup> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  void signup() {
    if (_name.text.isEmpty) {
      _Error1(context);
    } else if (_email.text.isEmpty) {
      _Error2(context);
    } else if (_password.text.isEmpty) {
      _Error3(context);
    } else {
      if (_name.text.isNotEmpty &&
          _email.text.isNotEmpty &&
          _password.text.isNotEmpty) {
        validation();
        _Success(context);
      }

      print(_name.text);
    }
  }

  void _Success(context) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: '${_name.text} you are signup Successfully!',
    );
  }

  void _Error1(context) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops...',
      text: 'Please enter valid name',
    );
  }

  void _Error2(context) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops...',
      text: 'Please enter valid email',
    );
  }

  void _Error3(context) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops...',
      text: 'Please enter valid password',
    );
  }

  void login() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Login(
            name: _name.text, email: _email.text, password: _password.text)));
  }

  void validation() {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => Login(
              name: _name.text, email: _email.text, password: _password.text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Signup'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 300,
                  child: TextField(
                      controller: _name,
                      decoration: InputDecoration(labelText: "name"))),
              Container(
                  width: 300,
                  child: TextField(
                      controller: _email,
                      decoration: InputDecoration(labelText: "email"))),
              Container(
                  width: 300,
                  child: TextField(
                    controller: _password,
                    decoration: InputDecoration(labelText: "password"),
                  )),
              TextButton(onPressed: signup, child: Text("Submit")),
            ],
          ),
        ));
  }
}
