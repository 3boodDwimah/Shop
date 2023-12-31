import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:shop_app/modules/login/cubit/states.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';


class SingInCubit extends Cubit<SingInStates> {
  SingInCubit() : super(SingInInitialState());

  static SingInCubit get(context) => BlocProvider.of(context);

  SingModel? singModel;

  void userLogin({
    required String email,
    required String password,
  })
  {
    emit(SingInLoadingState());

    DioHelper.postData(
      url: LOGIN,
      data:
      {
        'email': email,
        'password': password,
      },
    ).then((value)
    {
      print(value.data);
      singModel = SingModel.fromJson(value.data);
      emit(SingInSuccessState(singModel!));
    }).catchError((error)
    {
      print(error.toString());
      emit(SingInErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(ShopChangePasswordVisibilityState());
  }
}