import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/cubit.dart';
import 'package:shop_app/layout/cubit/states.dart';
import 'package:shop_app/shared/components/components.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
              ),
              leading: InkWell(
                  onTap: () {
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
            body: (state is! ShopLoadingGetFavoritesState)
                ? SingleChildScrollView(
                    child: SafeArea(
                        child: Column(
                          children: [
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
                                      "Favourite",
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontFamily: "Poppins Bold",
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),

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
                            Container(
                              height: MediaQuery.of(context).size.height,

                              child: GridView.builder(
                                  shrinkWrap: false,
                                  physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 2 / 2.5,
                                mainAxisSpacing: 2,
                                crossAxisSpacing: 2),
                      itemBuilder: (context, index) => buildListProduct(
                                ShopCubit.get(context)
                                    .favoritesModel!
                                    .data!
                                    .data![index]
                                    .product,
                                context),
                      itemCount: ShopCubit.get(context)
                                .favoritesModel!
                                .data!
                                .data!
                                .length,
                    ),
                            ),
                          ],
                        )),
                  )
                : Center(child: CircularProgressIndicator()));
      },
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
                          IconButton(
                            onPressed: () {
                              ShopCubit.get(context).changeFavorites(model.id);
                            },
                            icon: CircleAvatar(
                              radius: 15.0,
                              backgroundColor:
                                  ShopCubit.get(context).favorites[model.id]!
                                      ? Colors.deepPurple
                                      : Colors.grey,
                              child: Icon(
                                Icons.favorite_border,
                                size: 14.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        )

        );


