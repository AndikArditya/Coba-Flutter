import 'package:andik_uas_ram/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatelessWidget {
  TextEditingController userNameController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: SafeArea(
          child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Text(
              'Nama: Benedictus Andik \NIM: 190103155',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // background
                  onPrimary: Colors.white,
                  padding: EdgeInsets.fromLTRB(60, 17, 60, 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                child: Text('Logout'),
                onPressed: () {
                  var box = Hive.box('userBox');
                  box.put('isLogin', false);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (builder) => LoginScreen()));
                },
              ),
            ),
          )
        ],
      )),
    );
  }
}
