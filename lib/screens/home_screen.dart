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
    // Fetch data from API
    getDataFromApi();
  }

  void getDataFromApi() {
    // Show loader while data is not fetched
    setState(() {
      isLoading = true;
    });
    ApiService().getData()
        .then((value) {
          // Save value in header and hide loader
          setState(() {
            header = value;
            isLoading = false;
          });
        })
        .catchError((onError) {
          // Hide loader
          setState(() {
            isLoading = false;
          });
          // Show snackBar as error occurred
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
