import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_app/components/bubbles_art.dart';
import 'package:job_app/components/my_custom_clipper.dart';
import 'package:job_app/constants.dart';

class JobListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double clipHt = size.height * 0.42;
    double clipRadius = 60;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: size.width,
                  height: clipHt,
                  child: ClipPath(
                    clipper: MyCustomClipper(shapeIndex: 0),
                    child: Container(
                      color: kAccentColor,
                      child: Stack(
                        children: [
                          Positioned(
                              top: -10,
                              right: -20,
                              child: BubblesArt(size: size.width / 1.7)),
                          Padding(
                            padding: EdgeInsets.only(left: 25, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.arrow_back),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                SizedBox(
                                  height: clipHt / 5,
                                ),
                                buildTitle(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    right: 25,
                    bottom: clipHt * 0.22,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(
                        Icons.more,
                        color: Colors.white,
                      ),
                    ))
              ],
            ),
            Expanded(
              child: Container(
                height: size.height - clipHt,
                width: size.width,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemCount: categories[0].jobs.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(categories[0].jobs[index].id),
                        background: slideRightBackground(),
                        child: Container(
                          height: 100,
                          margin:
                              EdgeInsets.only(left: 25, right: 25, bottom: 20),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: kAccentColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Row(
                            children: [
                              Container(
                                width: 65,
                                height: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white),
                                child: Icon(Icons.access_alarm_rounded),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    categories[0].jobs[index].title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Spacer(),
                                  Text(
                                    categories[0].jobs[index].salary,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return RichText(
      text: TextSpan(
        text: "${categories[0].jobs[0].title}",
        style: TextStyle(
            color: kTextColor, fontSize: 30, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
              text: "\n${categories[0].jobs[0].totalJob} Job Opportunity",
              style: TextStyle(
                color: kTextColor,
                fontSize: 18,
                height: 2,
                fontWeight: FontWeight.normal,
              )),
        ],
      ),
    );
  }

  Widget slideRightBackground() {
    return Container(
      color: Colors.lightGreenAccent,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.edit,
              color: Colors.white,
            ),
            Text(
              " Edit",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }
}
