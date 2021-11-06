class Component {
  String type;
  String url;
  String title;
  String desc;

  Component(
      {required this.type,
      required this.url,
      required this.title,
      required this.desc});

  // Used to get Component Object from map.
  factory Component.fromJson(Map<String, dynamic> json) => Component(
      type: json["type"] == null ? "" : json["type"],
      url: json["url"] == null ? "" : json["url"],
      title: json["title"] == null ? "" : json["title"],
      desc: json["desc"] == null ? "" : json["desc"]);

  @override
  String toString() {
    return "Component(type: $type, url: $url, title: $title, desc: $desc)";
  }

}
