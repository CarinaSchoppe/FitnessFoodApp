import 'package:flutter/material.dart';

class DietModel {
  final String name;
  final String iconPath;
  final String level;
  final String duration;
  final String calorie;
  bool viewIsSelected;
  MaterialAccentColor boxColor;

  DietModel(this.name, this.iconPath, this.level, this.duration, this.calorie, this.viewIsSelected, this.boxColor);

  static List<DietModel> getDiet() {
    var diet = <DietModel>[];
    diet.add(DietModel("Honey Pencake", "icons/honey-pancakes.svg", "Easy", "30mins", "180kCals", true, Colors.lightBlueAccent));
    diet.add(DietModel("Canai Bread", "icons/canai-bread.svg", "Easy", "20mins", "230kCal", false, Colors.deepPurpleAccent));
    return diet;
  }
}
