import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_layout.dart';
import 'package:shop_app/modules/LaunchScreen.dart';
import 'package:shop_app/modules/choose/choose.dart';
import 'package:shop_app/modules/login/Sing_in.dart';
import 'package:shop_app/modules/products/products_screen.dart';
import 'package:shop_app/modules/register/sing_up.dart';
import 'package:shop_app/modules/search/search_screen.dart';
import 'package:shop_app/shared/cubit/cubit.dart';
import 'package:shop_app/shared/cubit/states.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

import 'layout/cubit/cubit.dart';
import 'modules/on_boarding/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getData(key: 'isDark');

  runApp(MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  MyApp({
    this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit()..changeAppMode(),
        ),
        BlocProvider(
          create: (BuildContext context) => ShopCubit()
            ..getHomeData()
            ..getCategories()
            ..getFavorites()
            ..getUserData()
            ..getProductDetails(53)
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: "/launch_screen",
            routes: {
              '/launch_screen': (context) => LaunchScreen(),
              '/boarding': (context) => OnBoarding(),
              '/choose': (context) => Choose(),
              '/singin': (context) => SingIn(),
              '/singup': (context) => SingUp(),
              '/shoplayout': (context) => ShopLayout(),
              '/searchscreen': (context) => SearchScreen(),
              '/productsscreen': (context) => ProductsScreen(),
            },
          );
        },
      ),
    );
  }
}
