import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'models/category_models.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModel> categories = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _searchbar(),
          const SizedBox(
            height: 40,
          ),
          Column(
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
                            decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(categories[index].iconPath),
                            ),
                          ),
                          Text(categories[index].name, style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400)),
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
          )
        ],
      ),
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
