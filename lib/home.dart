import 'package:flutter/material.dart';
import 'package:flutter_learning/models/diet_model.dart';
import 'package:flutter_learning/models/popular_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'models/category_models.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  void _getPopularDiets() {
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  void _getDiets() {
    diets = DietModel.getDiet();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    _getDiets();
    _getPopularDiets();
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _searchbar(),
          const SizedBox(
            height: 40,
          ),
          _itemslider(),
          const SizedBox(
            height: 40,
          ),
          _dietText(),
          const SizedBox(
            height: 15,
          ),
          diet(),
          const SizedBox(
            height: 15,
          ),
          popularText(),
          const SizedBox(
            height: 15,
          ),
          Container(
            color: Colors.redAccent.withOpacity(0.15),
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: popularDiets[index].boxIsSelected ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: popularDiets[index].boxIsSelected
                            ? [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.07),
                                  offset: const Offset(0, 10),
                                  blurRadius: 40,
                                  spreadRadius: 0,
                                )
                              ]
                            : []),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          popularDiets[index].iconPath,
                          width: 65,
                          height: 65,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              popularDiets[index].name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              popularDiets[index].level + " | " + popularDiets[index].duration + " | " + popularDiets[index].calorie,
                              style: const TextStyle(
                                color: Colors.brown,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            "icons/button.svg",
                            width: 30,
                            height: 30,
                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: 25,
                    ),
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                itemCount: popularDiets.length),
          )
        ],
      ),
    );
  }

  Column popularText() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(padding: EdgeInsets.all(8)),
        Text(
          "Popular Diets",
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  Container diet() {
    return Container(
      height: 240,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            width: 210,
            decoration: BoxDecoration(color: diets[index].boxColor.withOpacity(0.3), borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(diets[index].iconPath),
                Text(
                  diets[index].name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                Text(
                  diets[index].level + " | " + diets[index].duration + " | " + diets[index].calorie,
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  height: 45,
                  width: 130,
                  child: Center(
                    child: Text(
                      "View",
                      style: TextStyle(
                        color: diets[index].viewIsSelected ? Colors.white : Colors.pinkAccent,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(gradient: LinearGradient(colors: [diets[index].viewIsSelected ? Colors.blueAccent : Colors.transparent, diets[index].viewIsSelected ? Colors.lightBlueAccent : Colors.transparent]), borderRadius: BorderRadius.circular(50)),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 25,
        ),
        itemCount: diets.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 20, right: 20),
      ),
    );
  }

  Column _dietText() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(left: 20)),
        Text(
          "Recommendation \n for Diet",
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  Column _itemslider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            "Category",
            style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 120,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                decoration: BoxDecoration(color: categories[index].boxColor.withOpacity(0.3), borderRadius: BorderRadius.circular(16)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(categories[index].iconPath),
                      ),
                    ),
                    Text(categories[index].name, style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400)),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 25,
              );
            },
          ),
        )
      ],
    );
  }

  Container _searchbar() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: const BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 40, spreadRadius: 0.0)],
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Search Pancake",
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset("icons/Search.svg"),
            ),
            suffixIcon: Container(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const VerticalDivider(
                      indent: 10,
                      endIndent: 10,
                      color: Colors.black,
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset("icons/Filter.svg"),
                    ),
                  ],
                ),
              ),
            ),
            filled: true,
            contentPadding: const EdgeInsets.all(15),
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text(
        "Flutter Learning 2",
        style: TextStyle(
          backgroundColor: Colors.blue,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(10),
          width: 30,
          alignment: Alignment.center,
          child: SvgPicture.asset(
            "icons/Arrow - Left 2.svg",
            height: 20,
            width: 20,
          ),
          height: 30,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
        ),
      ),
      actions: [
        GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(10),
              width: 37,
              alignment: Alignment.center,
              child: SvgPicture.asset(
                "icons/dots.svg",
                height: 5,
                width: 5,
              ),
              height: 30,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            )),
      ],
    );
  }
}
