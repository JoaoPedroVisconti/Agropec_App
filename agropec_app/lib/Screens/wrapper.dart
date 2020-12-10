import 'package:flutter/material.dart';
import 'package:agropec_app/Screens/Authentication/authenticate.dart';
import 'package:agropec_app/Models/user_model.dart';
import 'package:agropec_app/Screens/Home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser>(context);
    // print(user);

    // Return Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
