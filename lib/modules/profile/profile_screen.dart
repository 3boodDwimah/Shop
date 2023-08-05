import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/cubit.dart';
import 'package:shop_app/layout/cubit/states.dart';
import 'package:shop_app/shared/components/components.dart';

class ProfileScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var model ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        (ShopCubit.get(context).userModel == null)?
            CircularProgressIndicator()
            :
         model = ShopCubit.get(context).userModel;
        nameController.text = model!.data!.name!;
        emailController.text = model.data!.email!;
        phoneController.text = model.data!.phone!;

        return

            (ShopCubit.get(context).userModel != null)
                ? SafeArea(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0,right: 20),
                        child: Form(
                          key: formKey,
                          child:
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(25.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0x2e5b4dbc),
                                          offset: Offset(-7.347880586115415e-16, 12),
                                          blurRadius: 32,
                                        ),
                                      ],
                                    ),

                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Column(
                                    children: [

                                      Stack(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Color(0xff5B4DBC),
                                            child: Image.asset(
                                              "assets/images/imageccount.png",
                                              fit: BoxFit.fill,
                                            ),
                                            radius: 45,
                                          ),
                                          Positioned(
                                              right: 15,
                                              bottom: 0,
                                              child:
                                                  Image.asset("assets/images/box.png",color: Colors.black,)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(height: 10,),
                                          Text(
                                            'Welcome to',
                                            style: TextStyle(
                                              fontFamily: 'Poppins-Medium',
                                              fontSize: 18,
                                              color: const Color(0xff000000),
                                              height: 1.999999788072374,
                                            ),
                                            textHeightBehavior: TextHeightBehavior(
                                                applyHeightToFirstAscent: false),
                                            textAlign: TextAlign.center,
                                            softWrap: false,
                                          ),
                                          Text(
"${        nameController.text = model!.data!.name!} \!",
                                            style: TextStyle(
                                              fontFamily: 'Poppins-Bold',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                              color: const Color(0xffffa183),
                                              height: 1.1999998728434245,
                                            ),
                                            textHeightBehavior: TextHeightBehavior(
                                                applyHeightToFirstAscent: false),
                                            textAlign: TextAlign.center,
                                            softWrap: false,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(width: 10,),
                                          Column(
                                            children: [
                                              Text(
                                                'Account',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins-Regular',
                                                  fontSize: 16,
                                                  color: const Color(0xff5b4dbc),
                                                  height: 0.2643492562430247,
                                                ),
                                                textHeightBehavior: TextHeightBehavior(
                                                    applyHeightToFirstAscent: false),
                                                softWrap: false,
                                              ),
                                              SizedBox(height: 7,),
                                              Container(height: 5,width: 60,
                                              decoration: BoxDecoration(
                                                 color: Color(0xff5b4dbc)
                                              ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Text(
                                            'Payment',
                                            style: TextStyle(
                                              fontFamily: 'Poppins-Regular',
                                              fontSize: 15,
                                              color: const Color(0xff5D5760),
                                              height: 0.2643492562430247,
                                            ),
                                            textHeightBehavior: TextHeightBehavior(
                                                applyHeightToFirstAscent: false),
                                            softWrap: false,
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Text(
                                            'Notification',
                                            style: TextStyle(
                                              fontFamily: 'Poppins-Regular',
                                              fontSize: 15,
                                              color: const Color(0xff5D5760),
                                              height: 0.2643492562430247,
                                            ),
                                            textHeightBehavior: TextHeightBehavior(
                                                applyHeightToFirstAscent: false),
                                            softWrap: false,
                                          ), SizedBox(
                                            width: 30,
                                          ),
                                          Text(
                                            'Policy',
                                            style: TextStyle(
                                              fontFamily: 'Poppins-Regular',
                                              fontSize: 15,
                                              color: const Color(0xff5D5760),
                                              height: 0.2643492562430247,
                                            ),
                                            textHeightBehavior: TextHeightBehavior(
                                                applyHeightToFirstAscent: false),
                                            softWrap: false,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      if (state is ShopLoadingUpdateUserState)
                                        LinearProgressIndicator(color: Colors.deepPurple),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      defaultFormField(
                                        colors: Color(0xff1A1A20),

                                        controller: nameController,
                                        type: TextInputType.name,
                                        validate: (value) {
                                          if (value.isEmpty) {
                                            return 'name must not be empty';
                                          }

                                          return null;
                                        },
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      defaultFormField(
                                        colors: Color(0xff1A1A20),

                                        controller: emailController,
                                        type: TextInputType.emailAddress,
                                        validate: (value) {
                                          if (value.isEmpty) {
                                            return 'email must not be empty';
                                          }

                                          return null;
                                        },
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      defaultFormField(
                                        colors: Color(0xff1A1A20),

                                        controller: phoneController,
                                        type: TextInputType.phone,
                                        validate: (value) {
                                          if (value.isEmpty) {
                                            return 'phone must not be empty';
                                          }

                                          return null;
                                        },
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height / 6.2,
                                      ),

                                    ],
                              ),
                            ),
                          ),
                                  SizedBox(height: 20,),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/box.png",
                                            color: Color(0xff5D5760),
                                          ),
                                          Container(
                                            height: 50,
                                            width: 95,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(15)),
                                            child: MaterialButton(
                                              onPressed: () {
                                                signOut(context);
                                              },
                                              child: Text(
                                                'Logout',
                                                style: TextStyle(
                                                    color: Color(0xff5D5760)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width:
                                        MediaQuery.of(context).size.width / 4.6,
                                      ),
                                      Container(
                                        height: 50,
                                        width: 159,
                                        decoration: BoxDecoration(
                                            color: Color(0xff5B4DBC),
                                            borderRadius:
                                            BorderRadius.circular(20)),
                                        child: MaterialButton(
                                          onPressed: () {
                                            if (formKey.currentState!.validate()) {
                                              ShopCubit.get(context).updateUserData(
                                                name: nameController.text,
                                                phone: phoneController.text,
                                                email: emailController.text,
                                              );
                                            }
                                          },
                                          child: Text(
                                            'Save Profile',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                        ),
                      ),
                    ),
                  )
                : Center(child: CircularProgressIndicator());
      },
    );
  }
}
