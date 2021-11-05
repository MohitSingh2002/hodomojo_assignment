import 'package:flutter/material.dart';
import 'package:hodomojo_assignment/dialogs/home_screen_dialog.dart';
import 'package:hodomojo_assignment/models/header.dart';
import 'package:hodomojo_assignment/services/api_service.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Header header;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getDataFromApi();
  }

  void getDataFromApi() {
    setState(() {
      isLoading = true;
    });
    ApiService().getData()
        .then((value) {
          setState(() {
            header = value;
            isLoading = false;
          });
        })
        .catchError((onError) {
          setState(() {
            isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Some error occurred, please try again later"),
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: isLoading ? const CircularProgressIndicator() : HomeScreenDialog(
            header: header,
          ),
        ),
      ),
    );
  }
}
