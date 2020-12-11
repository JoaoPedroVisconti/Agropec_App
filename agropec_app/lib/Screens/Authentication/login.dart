import 'package:agropec_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:agropec_app/Models/global.dart';

class Login extends StatefulWidget {
  final Function toggleView;

  Login({this.toggleView});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.green,
      // appBar: AppBar(
      //   centerTitle: true,
      //   elevation: 10,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //         bottomLeft: Radius.circular(20),
      //         bottomRight: Radius.circular(20)),
      //   ),
      //   backgroundColor: buttonBlueLight,
      //   title: Text(
      //     'Login',
      //     style: TextStyle(
      //       color: greenMiddle,
      //     ),
      //   ),
      //   actions: [
      //     FlatButton.icon(
      //       onPressed: () {
      //         widget.toggleView();
      //       },
      //       icon: Icon(Icons.person),
      //       label: Text('Register'),
      //     )
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                greenBeg,
                greenMid,
                greenEnd,
              ],
            ),
          ),
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //       image: AssetImage('assets/background_login.png'),
          //       fit: BoxFit.fill),
          // ),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 100),
                child: Text(
                  'Login',
                  style: loginTitleStyle,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ),
                        ),
                      ),
                      validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                      onChanged: (val) {
                        setState(() {
                          email = val.trim();
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ),
                        ),
                      ),
                      validator: (val) => val.length < 6
                          ? 'Enter a Password 6+ Chars Long'
                          : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    RaisedButton(
                      color: buttonBlueLight,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: greenMiddle,
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic result = await _auth
                              .loginWithEmailAndPassword(email, password);

                          if (result == null) {
                            setState(() {
                              error =
                                  'Could not login in with those Credentials';
                            });
                          }
                        }
                      },
                    ),
                    SizedBox(height: 12),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an accont yet?"),
                        SizedBox(width: 5),
                        OutlineButton(
                          onPressed: () {
                            widget.toggleView();
                          },
                          child: Text('Register'),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
