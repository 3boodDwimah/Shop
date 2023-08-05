import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          backgroundColor: Color(0xffFFFFFF),


          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            onTap: (index) {
              cubit.changeBottom(index);
            },
            currentIndex: cubit.currentIndex,
            items: [
              BottomNavigationBarItem(
                activeIcon: Image.asset("assets/images/Homeact.png"),
                icon:Image.asset("assets/images/Home.png"),
                label: '',
              ),
              BottomNavigationBarItem(
                icon:Image.asset("assets/images/Categories.png"),
                activeIcon: Image.asset("assets/images/Categoriesact.png"),
                label: '',
              ),
              BottomNavigationBarItem(
                icon:Image.asset("assets/images/Favourite.png"),
                activeIcon: Image.asset("assets/images/Favouriteact.png"),
                label: '',
              ),
              BottomNavigationBarItem(
                icon:Image.asset("assets/images/Your cart.png"),
                activeIcon: Image.asset("assets/images/Your cartact.png"),
                label: '',
              ),
            ],
          ),
        );
      },
    );
  }
}
