import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SingUp extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SingUpCubit(),
      child: BlocConsumer<SingUpCubit, SingUpStates>(
        listener: (context, state) {
          if (state is SingUpStatesSuccessState) {
            if (state.singModel.status!) {
              CacheHelper.saveData(
                key: 'token',
                value: state.singModel.data!.token,
              ).then((value) {
                token = state.singModel.data!.token!;
Navigator.pushReplacementNamed(context, "/shoplayout");

              });
            } else {
              print(state.singModel.message);

              showToast(
                text: state.singModel.message!,
                state: ToastStates.ERROR,
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Color(0xff5B4DBC),
            body: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/Content.png"),
                      fit: BoxFit.cover)),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, "/choose");
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                )),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, "/singin");
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  fontFamily: 'Poppins-Medium',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: const Color(0xffffffff),
                                  height: 2.113392639160156,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                softWrap: false,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontFamily: 'Poppins-Bold',
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                              color: const Color(0xffffffff),
                              height: 2.113392639160156,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Container(
                                alignment: Alignment.center,
                                width: 176,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: const Color(0xffecc35a),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Image.asset("assets/images/box.png"),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Text(
                                      'With Google',
                                      style: TextStyle(
                                        fontFamily: 'Poppins-Medium',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: const Color(0xffffffff),
                                        height: 0.113392639160156,
                                      ),
                                      textHeightBehavior: TextHeightBehavior(
                                          applyHeightToFirstAscent: false),
                                      softWrap: false,
                                    ),
                                    Spacer(
                                      flex: 3,
                                    ),
                                  ],
                                )),
                            SizedBox(
                              width: 40,
                            ),
                            Container(
                                alignment: Alignment.center,
                                width: 56,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: const Color(0xff1A1A20),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Image.asset("assets/images/box.png")),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                                alignment: Alignment.center,
                                width: 56,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: const Color(0xff1A1A20),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Image.asset("assets/images/box.png")),
                          ],
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Or with Email",
                            style: TextStyle(
                              color: Color(0xffffffff),
                              fontFamily: 'Poppins-Regular',
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        defaultFormField(
                          colors: Color(0xff1A1A20),
                          hint: 'Your Name',
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'please enter your your name';
                            }
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          colors: Color(0xff1A1A20),
                          hint: 'Your Email',
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'please enter your email address';
                            }
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          colors: Color(0xff1A1A20),
                          hint: 'Phone Number',
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'please enter your phone number';
                            }
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          colors: Color(0xff1A1A20),
                          hint: 'PassWord',
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          isPassword: SingUpCubit.get(context).isPassword,
                          suffixPressed: () {
                            SingUpCubit.get(context).changePasswordVisibility();
                          },
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'password is too short';
                            }
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        MaterialButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              SingUpCubit.get(context).userRegister(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                phone: phoneController.text,
                              );
                            }
                          },
                          child: Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: 55,
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
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                softWrap: false,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
