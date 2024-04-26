class PopularDietsModel {
  final String name;
  final String iconPath;
  final String level;
  final String duration;
  final String calorie;
  bool boxIsSelected;

  PopularDietsModel(this.name, this.iconPath, this.level, this.duration, this.calorie, this.boxIsSelected);

  static List<PopularDietsModel> getPopularDiets() {
    var popularDiets = <PopularDietsModel>[];
    popularDiets.add(PopularDietsModel("Blueberry Pancake", "icons/blueberry-pancake.svg", "Easy", "30mins", "180kCals", true));
    popularDiets.add(PopularDietsModel("Salmon Nigiri", "icons/salmon-nigiri.svg", "Easy", "20mins", "230kCal", false));
    return popularDiets;
  }
}
