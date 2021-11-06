import 'dart:convert';
import 'package:hodomojo_assignment/models/header.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const api = "http://website-bucket-12234.s3-website-us-east-1.amazonaws.com/api.json";

  // Function used to fetch data from the API.
  Future<Header> getData() async {
    var res = await http.get(Uri.parse(api));
    return Header.fromJson(json.decode(res.body)["data"]);
  }

}
