
import '../../../models/login_model.dart';

abstract class SingUpStates {}

class SingUpInitialState extends SingUpStates {}

class SingUpStatesLoadingState extends SingUpStates {}

class SingUpStatesSuccessState extends SingUpStates
{
  final SingModel singModel;

  SingUpStatesSuccessState(this.singModel);
}

class SingUpStatesErrorState extends SingUpStates
{
  final String error;

  SingUpStatesErrorState(this.error);
}

class SingUpStatesChangePasswordVisibilityState extends SingUpStates {}