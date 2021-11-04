import 'dart:convert';
import 'package:hodomojo_assignment/models/header.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const api = "http://website-bucket-12234.s3-website-us-east-1.amazonaws.com/api.json";

  Future<Header> getData() async {
    var res = await http.get(Uri.parse(api));
    // print('JSON : ${json.decode(res.body)["data"]}');
    return Header.fromJson(json.decode(res.body)["data"]);
  }
}
