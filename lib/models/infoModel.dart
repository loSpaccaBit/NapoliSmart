import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart';

class Information {
  final String title;
  final String subTitle;
  final String subText;
  final List<String> assets;

  Information({
    required this.title,
    required this.subTitle,
    required this.subText,
    required this.assets,
  });

  factory Information.fromJson(Map<String, dynamic> json) {
    return Information(
      title: json["title"] ?? "",
      subTitle: json["subTitle"] ?? "",
      subText: json["subText"] ?? "",
      assets:
          (json["assets"] as List<dynamic>).map((e) => e.toString()).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "subTitle": subTitle,
      "subText": subText,
      "assets": assets,
    };
  }
}

Future<List<Information>> readJsonFile(String pathAssets) async {
  //final file = File(path);
  final String path = await rootBundle.loadString(pathAssets);
  //final file = File(path);
  // if (await file.exists()) {
  //   print('Esiste');
  //   final String content = await file.readAsString();
  final List<dynamic> jsonDataList = jsonDecode(path);

  final List<Information> informationList =
      jsonDataList.map((json) => Information.fromJson(json)).toList();

  return informationList;
  /*  } else {
    print('non esiste');
    throw Exception("Il file JSON non esiste.");
  } */
}
