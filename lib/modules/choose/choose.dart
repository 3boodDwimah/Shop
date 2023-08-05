import 'package:flutter/material.dart';

class Choose extends StatelessWidget {
  const Choose({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5B4DBC),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Content.png"),
                    fit: BoxFit.cover)),
          ),
          Positioned(
            bottom: 0,
            top: 150,
            right: 10,
            left: 0,
            child: Container(
              child: Column(
                children: [
                  Text(
                    "Let’s enjoy\n your Vacation!",
                    style: TextStyle(
                      fontFamily: 'Poppins-Bold',
                      fontSize: 36,
                      color: const Color(0xffffffff),
                      height: 0.999999894036187,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, "/singin");
                    },
                    child:
                    Container(
                        alignment: Alignment.center,
                        width: 219,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xffecc35a),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontFamily: 'Poppins-Medium',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: const Color(0xffffffff),
                            height: 2.113392639160156,
                          ),
                          textHeightBehavior:
                              TextHeightBehavior(applyHeightToFirstAscent: false),
                          softWrap: false,
                        )),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  MaterialButton(
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, "/singup");

                    },
                    child: Container(
                        alignment: Alignment.center,
                        width: 219,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xffFFA183),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontFamily: 'Poppins-Medium',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: const Color(0xffffffff),
                            height: 2.113392639160156,
                          ),
                          textHeightBehavior:
                              TextHeightBehavior(applyHeightToFirstAscent: false),
                          softWrap: false,
                        )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
