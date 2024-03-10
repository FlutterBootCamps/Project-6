part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserSignedUpState extends UserState {

}

final class UserSignUpErrorState extends UserState {
  final String msg;

  UserSignUpErrorState({required this.msg});
}

final class UserSignUpLoadingState extends UserState {

}

final class UserLoggedInState extends UserState {

}

final class UserLogInErrorState extends UserState {
  final String msg;

  UserLogInErrorState({required this.msg});
}

final class UserLoginLoadingState extends UserState {
  
}

final class ShowUserInfoState extends UserState {
  final User user;

  ShowUserInfoState({required this.user});
}

final class ShowUserInfoLoadingState extends UserState {

}

final class UserInfoShowErrorState extends UserState {
  final String msg;

  UserInfoShowErrorState({required this.msg});
}

final class ImagePickedState extends UserState {
  final String imagePath;

  ImagePickedState({required this.imagePath});
}

final class ImageNotPickedState extends UserState {
  final String msg;

  ImageNotPickedState({required this.msg});
}

final class UserSignedOutState extends UserState {
  final String msg;

  UserSignedOutState({required this.msg});
}

final class UserEditState extends UserState {
  final String msg;
  
  UserEditState({required this.msg});
}

final class UserEditErrorState extends UserState {
  final String msg;
  
  UserEditErrorState({required this.msg});
}