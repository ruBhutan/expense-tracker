import 'package:athang_expense_tracker/base/style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../splash_screen.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> logoutUser() async{
    print('inside');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('_TOKEN', '');
    print('inside');
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>SplashScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home')
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Text('Home', style: TypoStyles().kPageHeader,),
            ),
            ElevatedButton(onPressed: (){logoutUser();}, child: Text('Logout'))
          ],
        ),
      )
    );
  }
}
