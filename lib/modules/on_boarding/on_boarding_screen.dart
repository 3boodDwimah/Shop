import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String TextSpan1;
  final String TextSpan2;
  final String TextSpan3;

  BoardingModel({
    required this.TextSpan1,
    required this.TextSpan2,
    required this.TextSpan3,
  });
}

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      TextSpan1: 'Let’s start',
      TextSpan2: 'your ',
      TextSpan3: 'Vacation!',
    ),
    BoardingModel(
      TextSpan1: 'Explore the',
      TextSpan2: 'earth ',
      TextSpan3: 'with us',
    ),
    BoardingModel(
      TextSpan1: 'A new way',
      TextSpan2: 'to ',
      TextSpan3: 'Travel',
    ),
  ];

  bool isLast = false;

  void submit() {
    CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value) {
      if (value) {
        Navigator.pushReplacementNamed(context, "/choose");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5B4DBC),

      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Group 530.png'),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PageView.builder(
                      physics: BouncingScrollPhysics(),
                      controller: boardController,
                      onPageChanged: (int index) {
                        if (index == boarding.length - 1) {
                          setState(() {
                            isLast = true;
                          });
                        } else {
                          setState(() {
                            isLast = false;
                          });
                        }
                      },
                      itemBuilder: (context, index) =>
                          buildBoardingItem(boarding[index]),
                      itemCount: boarding.length,
                    ),
                    Positioned(
                      top: 110,
                      child: SmoothPageIndicator(
                        controller: boardController,
                        effect: ExpandingDotsEffect(
                          dotColor: Colors.grey,
                          activeDotColor: Color(0xffffa183),
                          dotHeight: 6,
                          expansionFactor: 1.1,
                          dotWidth: 6,
                          spacing: 10.0,
                        ),
                        count: boarding.length,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(
                      .2,
                    )),
                child: Container(
                  height: 50,
                  width: 105,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(
                      .6,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(
                            .9,
                          ),
                        ),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white.withOpacity(.8),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                            onPressed: () {
                              if (isLast) {
                                submit();
                              } else {
                                boardController.nextPage(
                                  duration: Duration(
                                    milliseconds: 750,
                                  ),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                );
                              }
                            },
                            child: Icon(
                              Icons.arrow_right_alt_sharp,
                              size: 35,
                              color: Colors.black,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 80.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text.rich(
            TextSpan(
              style: TextStyle(
                fontFamily: 'Poppins-Bold',
                fontWeight: FontWeight.bold,
                fontSize: 36,
                color: const Color(0xffffffff),
                height: 0.999999894036187,
              ),
              children: [
                TextSpan(
                  text: '${model.TextSpan1}\n',
                ),
                TextSpan(
                  text: model.TextSpan2,
                ),
                TextSpan(
                  text: '${model.TextSpan3}\n',
                  style: TextStyle(
                    color: const Color(0xffffa183),
                  ),
                ),
              ],
            ),
            textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.center,
            softWrap: false,
          )
        ],
      );
}
