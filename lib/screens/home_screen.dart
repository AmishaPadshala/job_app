import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_app/components/bubbles_art.dart';
import 'package:job_app/components/my_custom_clipper.dart';
import 'package:job_app/constants.dart';
import 'package:job_app/screens/job_list_screen.dart';

class HomeScreen extends StatelessWidget {
  int activeCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double clip1Ht = size.height * 0.3;
    double clip2Ht = size.height * 0.4;
    double clipRadius = 60;

    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: size.width,
                  height: clip1Ht,
                  child: ClipPath(
                    clipper: MyCustomClipper(shapeIndex: 0),
                    child: Container(
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                Positioned(
                  top: clipRadius + ((clip1Ht - clip2Ht) / 2),
                  child: Container(
                    width: size.width * 0.8,
                    height: clip2Ht,
                    child: ClipPath(
                      clipper: MyCustomClipper(shapeIndex: 1),
                      child: Container(
                        color: kAccentColor,
                        child: Stack(
                          children: [
                            Positioned(
                                right: 0,
                                child:
                                    BubblesArt(size: (size.width * 0.8) / 1.8)),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 25, top: (clip2Ht - clipRadius) / 2.5),
                              child: buildTitle(),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 40),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildSection(size, "Explore Categories"),
                      buildCategories(),
                      buildSection(size, "Popular Search"),
                      buildPopularSearch()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPopularSearch() {
    return Container(
      height: 240,
      child: ListView.builder(
          itemCount: categories[0].jobs.length,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => JobListScreen()));
              },
              child: Container(
                margin: EdgeInsets.only(
                    bottom: 20,
                    left: index == 0 ? 20 : 0,
                    right: index == categories[0].jobs.length - 1 ? 20 : 10),
                width: 200,
                decoration: BoxDecoration(
                    color: index % 2 == 0 ? kAccentColor : kCardsBGColor,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: Stack(
                    children: [
                      Positioned(right: 0, child: BubblesArt(size: 200 / 1.4)),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 25, right: 25, bottom: 25),
                          child: RichText(
                              text: TextSpan(
                                  text: categories[0].jobs[index].title,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                  children: [
                                TextSpan(
                                    text:
                                        '\n${categories[0].jobs[index].totalJob} Job Opportunity',
                                    style: TextStyle(
                                        height: 2.5,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16))
                              ])),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget buildCategories() {
    return Container(
      height: 140,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                  left: index == 0 ? 20 : 0,
                  right: index == categories.length - 1 ? 20 : 10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: activeCategoryIndex == index
                      ? kPrimaryColor
                      : kCardsBGColor,
                  borderRadius: BorderRadius.circular(50)),
              child: Column(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: categories[index].icon,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(categories[index].name)
                ],
              ),
            );
          }),
    );
  }

  Container buildSection(Size size, String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      width: size.width,
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
                color: kTextColor, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          IconButton(icon: Icon(Icons.more_horiz), onPressed: () {})
        ],
      ),
    );
  }

  Widget buildTitle() {
    return RichText(
      text: TextSpan(
        text: "Welcome,\n",
        style: TextStyle(
          color: kTextColor,
          fontSize: 18,
        ),
        children: [
          TextSpan(
              text: "Find your\ndream Job!",
              style: TextStyle(
                color: kTextColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kPrimaryColor,
      leading: IconButton(
        icon: Icon(Icons.fullscreen),
        onPressed: () {},
      ),
      actions: [IconButton(icon: Icon(Icons.account_circle), onPressed: () {})],
    );
  }
}

void main() {
  var a = A();
}

class A {
  String name;
  String address;
}
