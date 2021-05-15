import 'dart:typed_data';

class ApplicationInfo {
  String name;
  String packageName;
  Uint8List? banner;
  Uint8List? icon;

  ApplicationInfo(this.name, this.packageName, this.banner, this.icon);

  factory ApplicationInfo.create(dynamic data) => ApplicationInfo(
      data["name"], data["packageName"], data["banner"], data["icon"]);
}
