import 'package:e_commerce/screens/home_bar.dart';
import 'package:e_commerce/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:e_commerce/screens/home_page.dart';

class Login extends StatefulWidget {
  final String name;
  final String email;
  final String password;
  Login(
      {Key? key,
      required this.name,
      required this.email,
      required this.password})
      : super(key: key);

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  void login() {
    if (_email.text.isEmpty) {
      _Error2(context);
    } else if (_password.text.isEmpty) {
      _Error3(context);
    } else {
      if (widget.email == _email.text && widget.password == _password.text) {
        validation();
        _Success(context);
        print("${widget.name} succesfully login");
      } else {
        _Error(context);
        print("wrong credential");
      }
    }
  }

  void validation() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => HomeBar(name1: widget.name)));
  }

  void signup() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Signup()));
  }

  void _Success(context) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: '${widget.name} you are login Successfully!',
    );
  }

  void _Error(context) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops...',
      text: 'Wrong Credential',
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

  @override
  Widget build(BuildContext context) {
    print("login ${widget.email}");
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              TextButton(onPressed: login, child: Text("Submit")),
            ],
          ),
        ));
  }
}
