import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/cubit.dart';
import 'package:shop_app/layout/cubit/states.dart';
import 'package:shop_app/models/categories_model.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
            ),
            leading: InkWell(
                onTap: (){
                  Navigator.pushNamed(context, "/searchscreen");
                },
                child: Image.asset("assets/images/search.png")),
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
          body: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                            fontSize: 28,
                            fontFamily: "Poppins Bold",
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        "Country",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xffB7B7B7),
                          fontFamily: "Poppins Medium",
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.keyboard_control_sharp,
                        color: Color(0xff5B4DBC),
                      ),
                      SizedBox(
                        width: 25,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  shrinkWrap: false,
                  physics: BouncingScrollPhysics(),

                  itemBuilder: (context, index) => buildCatItem(
                      ShopCubit.get(context)
                          .categoriesModel!
                          .data!
                          .data![index]),
                  itemCount: ShopCubit.get(context)
                      .categoriesModel!
                      .data!
                      .data!
                      .length,
                ),
              ),


            ]),
          ),
        );
      },
    );
  }

  Widget buildCatItem(DataModel model) => Padding(
      padding: const EdgeInsets.only(left: 20.0,top: 20,right: 20),
      child: Container(
        alignment: Alignment.center,
        width: 334,
        height: 110,
        decoration: BoxDecoration(
          color: const Color(0xffFFF4F2),
          borderRadius: BorderRadius.circular(25.0),
          border: Border.all(width: 1.0, color: const Color(0xffFFF4F2)),
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 35,
            child: Image.network(
              (model.image!),
              width: 60.0,
              height: 55.0,
              fit: BoxFit.cover,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              model.name!,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "234 Destinations",
              style: TextStyle(
                color: Color(0xffB7B7B7),
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          trailing: Image.asset("assets/images/box.png",color:Colors.black),
        ),
      ));
}
