import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/cubit.dart';
import 'package:shop_app/layout/cubit/states.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        var product = cubit.productDetailsModel!.productModel;
        var pageController = PageController();
        int pageIndex = 0;
        String productPrice = product.price.toString();
        var scrollController = ScrollController();

        return (state is! ShopLoadingGetProductDetailsState && product != null)
            ? Scaffold(
                backgroundColor: Colors.grey[100],
                body: SafeArea(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 400,
                            color: Colors.white,
                            child: PageView.builder(
                              controller: pageController,
                              itemBuilder: (context, index) {
                                pageIndex = index;
                                return ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30.0),
                                    bottomRight: Radius.circular(30.0),
                                  ),
                                  child: Image.network(
                                    '${product.images[index]}',
                                  ),
                                );
                              },
                              physics: BouncingScrollPhysics(),
                              itemCount: product.images.length,
                            ),
                          ),
                          Positioned(
                            top: 20,
                            right: 20,
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 5.0, top: 5.0),
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                    Colors.deepPurpleAccent),
                                color: Colors.grey[200],
                                borderRadius:
                                BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: IconButton(
                                  icon: Icon(
                                    cubit.favorites[product.id]!
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                  ),
                                  color:
                                  cubit.favorites[product.id]!
                                      ? Colors.deepPurple
                                      : Colors.grey,
                                  onPressed: () {
                                    cubit.changeFavorites(
                                        product.id);
                                  },
                                ),
                              ),
                            ),
                          ),

                          IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.deepPurple,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SmoothPageIndicator(
                        controller: pageController,
                        count: product.images.length,
                        effect: SlideEffect(
                          activeDotColor: Colors.deepPurple,
                          dotColor: Colors.grey,
                          dotHeight: 10,
                          dotWidth: 10,
                          spacing: 5.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.name,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                productPrice.length == 5
                                                    ? '${productPrice.substring(0, 2)},${productPrice.substring(2, productPrice.length)} L.E'
                                                    : '$productPrice L.E',
                                                style: TextStyle(
                                                  fontSize: 25.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.deepPurple,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),

                                            ],
                                          ),

                                        ],
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Text(
                                        'Description',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0,
                                          color: Colors.deepPurple,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Container(
                                        height: 222.0,
                                        width: double.infinity,
                                        padding: EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: SingleChildScrollView(
                                          child: Text(
                                            product.description,
                                            style: TextStyle(
                                              fontSize: 13.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              );

      },
    );
  }
}
