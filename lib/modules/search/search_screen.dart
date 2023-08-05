import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/cubit.dart';
import 'package:shop_app/modules/favorites/favorites_screen.dart';
import 'package:shop_app/shared/components/components.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              backgroundColor: Colors.white,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontFamily: 'Poppins-Regular',
                        fontSize: 18,
                        color: const Color(0xff000000),
                        height: 1.999999788072374,
                      ),
                      children: [
                        TextSpan(
                          text: 'Hi',
                        ),
                        TextSpan(

    text:
    (ShopCubit.get(context).userModel != null)?
    ' ${   ShopCubit.get(context).userModel!.data!.name} \!':"",
                          style: TextStyle(
                            fontFamily: 'Poppins-SemiBold',
                            color: const Color(0xffffa183),
                          ),
                        ),
                      ],
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    softWrap: false,
                  ),
                  Text(
                    'Let’s discovery a New Adventure',
                    style: TextStyle(
                      fontFamily: 'Poppins-Regular',
                      fontSize: 13,
                      color: const Color(0xffb7b7b7),
                      height: 2.769230475792518,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    softWrap: false,
                  ),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: CircleAvatar(
                    backgroundColor: Color(0xff5B4DBC),
                    radius: 25,
                    child: Image.asset(
                      "assets/images/imageccount.png",
                    ),
                  ),
                )
              ],
            ),
            body: SafeArea(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: searchController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter text to search';
                          }

                          return null;
                        },
                        onFieldSubmitted: (text) {
                          SearchCubit.get(context).search(text);
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 30, top: 35),
                          hintText: "Search ... ",
                          hintStyle: TextStyle(
                            color: Color(0xff5d5760),
                            fontFamily: 'Poppins-Regular',
                            fontSize: 14,
                            height: 1.5643492562430247,
                          ),
                          fillColor: Color(0xffF8F7FE),
                          filled: true,
                          suffixIcon: Image.asset("assets/images/search.png"),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      if (state is SearchLoadingState)
                        LinearProgressIndicator(),
                      SizedBox(
                        height: 10.0,
                      ),
                      if (state is SearchSuccessState)
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 2 / 2.5,
                                    mainAxisSpacing: 2,
                                    crossAxisSpacing: 2),
                            itemBuilder: (context, index) => buildListProduct(
                              SearchCubit.get(context)
                                  .model!
                                  .data!
                                  .data![index],
                              context,
                            ),
                            itemCount: SearchCubit.get(context)
                                .model!
                                .data!
                                .data!
                                .length,
                          ),
                        ),
                    ],
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

Widget buildListProduct(
  model,
  context,
) =>
    Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 7,
            ),
            Container(
              height: 79,
              width: 79,
              child: Image.network(
                model.image,
                width: 79,
                height: 79,
                fit: BoxFit.cover,
              ),
              decoration: BoxDecoration(
                color: const Color(0xffdedee0),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            Row(
              children: [
                SizedBox(width: 20),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 80,
                        height: 40,
                        child: Text(
                          model.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            height: 1.5,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 80,
                            child: Text("\$ ${model.price.toString()}",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 17,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.w700,
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
