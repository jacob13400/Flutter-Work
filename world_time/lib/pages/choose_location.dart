import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void getData() async {

    //simulate network request to get username
    String username = await Future.delayed(Duration(seconds: 3), () {
      return "Jake";
    });

    //simulate network request to get bio of user
    String bio = await Future.delayed(Duration(seconds: 2), () {
      return "My bio is amazing, refer jacobabraham.me";
    });

    print('$username - $bio');
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Text("Choose Location"),
    );
  }
}