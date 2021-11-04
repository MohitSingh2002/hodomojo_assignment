import 'package:hodomojo_assignment/models/component.dart';

class Header {
  String title;
  String type;
  List<Component> components;
  String coverUrl;

  Header(
      {required this.title,
      required this.type,
      required this.components,
      required this.coverUrl});

  factory Header.fromJson(Map<String, dynamic> json) => Header(
      title: json["title"],
      type: json["type"],
      components: List<Component>.from(
          json["components"].map((x) => Component.fromJson(x))),
      coverUrl: json["coverUrl"]);

  @override
  String toString() {
    return "Header(title: $title, type: $type, components: $components, coverUrl: $coverUrl)";
  }
}
