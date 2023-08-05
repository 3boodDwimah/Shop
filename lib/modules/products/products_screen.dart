import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/cubit.dart';
import 'package:shop_app/layout/cubit/states.dart';
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/modules/products/product_details/product_details.dart';
import 'package:shop_app/shared/components/components.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is ShopSuccessChangeFavoritesState) {
          if (!state.model.status!) {
            showToast(
              text: state.model.message!,
              state: ToastStates.ERROR,
            );
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
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
                          text:            (ShopCubit.get(context).userModel != null)?

                            ' ${ShopCubit.get(context).userModel!.data!.name}\ !':"",
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
            body: (ShopCubit.get(context).homeModel != null &&
                    ShopCubit.get(context).categoriesModel != null)
                ? builderWidget(ShopCubit.get(context).homeModel!,
                    ShopCubit.get(context).categoriesModel!, context)
                : Center(child: CircularProgressIndicator()));
      },
    );
  }

  Widget builderWidget(
          HomeModel model, CategoriesModel categoriesModel, context) =>
      SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    width: 330,
                    height: 55,
                    decoration: BoxDecoration(
                      color: const Color(0xfff8f7fe),
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    child: Row(
                      children: [
                        Text("Search .."),
                        Spacer(),
                        Image.asset("assets/images/search.png")
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 120.0,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => buildCategoryItem(
                              categoriesModel.data!.data![index]),
                          separatorBuilder: (context, index) => SizedBox(
                            width: 10.0,
                          ),
                          itemCount: categoriesModel.data!.data!.length,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Discover',
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 1,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    childAspectRatio: 1.8 / 1.1,
                    children: List.generate(
                      model.data!.products.length,
                      (index) => buildGridProduct(
                          model.data!.products[index], context, () {
                        ShopCubit.get(context)
                            .getProductDetails(model.data!.products[index].id!);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetails()));
                      }),
                    ),
                  ),
                ),
                CarouselSlider(
                  items: model.data!.banners
                      .map(
                        (e) => Image(
                          image: NetworkImage(e.image!),
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    height: 200,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(seconds: 1),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildCategoryItem(DataModel model) => Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Image(
              image: NetworkImage(model.image!),
              height: 71.0,
              width: 71.0,
              fit: BoxFit.none,
            ),
          ),
          SizedBox(
            height: 9,
          ),
          Container(
            width: 71.0,
            child: Text(
              model.name!,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Poppins-Medium',
              ),
            ),
          ),
        ],
      );

  Widget buildGridProduct(
          ProductModel model, context, void Function() onPressed) =>
      InkWell(
        onTap: onPressed,
        child: Container(
          color: Color(0xffCFC8FF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.only(left: 6.0, top: 15),
                  child: Text(
                    model.name!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18.0,
                      height: 1.3,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 10),
                child: Image(
                  image: NetworkImage(model.image!),
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: 150.0,
                ),
              ),
            ],
          ),
        ),
      );
}
