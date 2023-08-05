import 'package:shop_app/models/login_model.dart';

abstract class SingInStates {}

class SingInInitialState extends SingInStates {}

class SingInLoadingState extends SingInStates {}

class SingInSuccessState extends SingInStates
{
  final SingModel singModel;

  SingInSuccessState(this.singModel);
}

class SingInErrorState extends SingInStates
{
  final String error;

  SingInErrorState(this.error);
}

class ShopChangePasswordVisibilityState extends SingInStates {}