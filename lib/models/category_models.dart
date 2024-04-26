import 'package:flutter/material.dart';

class CategoryModel {
  final String name;
  final String iconPath;
  final MaterialAccentColor boxColor;

  CategoryModel(this.name, this.iconPath, this.boxColor);

  static List<CategoryModel> getCategories() {
    var categories = <CategoryModel>[];
    categories.add(CategoryModel("Salad", "icons/plate.svg", Colors.deepPurpleAccent));
    categories.add(CategoryModel("Cake", "icons/pancakes.svg", Colors.lightBlueAccent));
    categories.add(CategoryModel("Pie", "icons/pie.svg", Colors.deepPurpleAccent));
    categories.add(CategoryModel("Smoothies", "icons/orange-snacks.svg", Colors.lightBlueAccent));
    return categories;
  }
}
