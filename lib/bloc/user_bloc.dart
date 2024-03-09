import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_week6_day3_lab/data_layer/home_data_layer.dart';
import 'package:flutter_week6_day3_lab/models/user_model.dart';
import 'package:flutter_week6_day3_lab/services/user_service.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) {});

    on<SignupEvent>(signup);
    on<LoginEvent>(login);
    on<ViewProfileEvent>(viewProfile);
    on<PickProfilePictureEvent>(pickProfilePicture);
    on<UserSignoutEvent>(signout);
  }

  FutureOr<void> signup(SignupEvent event, Emitter<UserState> emit) async {
    if (event.email.trim().isNotEmpty &&
        event.name.trim().isNotEmpty &&
        event.password.trim().isNotEmpty) {
      if (EmailValidator.validate(event.email)) {
        emit(UserSignUpLoadingState());
        try {
          // final isAvailable = await UserService().isAvailable(event.email); //This functionality isn't properly working from the API side, so it's been deprecated.
          // if (isAvailable) {
            await UserService().createUser(
              name: event.name,
              email: event.email,
              password: event.password,
              path: event.imgPath,
            );
            emit(UserSignedUpState());
          // }else {
          //   emit(UserSignUpErrorState(
          //     msg:
          //         "This email is already taken!"));
          // }
        } catch (error) {
          emit(UserSignUpErrorState(
              msg:
                  "There's a problem with our serivce, please try again later..."));
        }
      } else {
        emit(UserSignUpErrorState(
            msg:
                "Make sure your email is in correct format 'someone@something.com"));
      }
    } else {
      emit(UserSignUpErrorState(msg: "Make sure you input all fields."));
    }
  }

  FutureOr<void> login(LoginEvent event, Emitter<UserState> emit) async {
    if (event.email.trim().isNotEmpty && event.password.trim().isNotEmpty) {
      if (EmailValidator.validate(event.email)) {
        emit(UserLoginLoadingState());
        try {
          String token = await UserService()
              .login(email: event.email, password: event.password);
          locator.currentBearerToken = token;
          emit(UserLoggedInState());
        } catch (e) {
          emit(UserLogInErrorState(msg: "Email or passowrd is incorrect!"));
        }
      } else {
        emit(UserLogInErrorState(
            msg:
                "Make sure your email is in correct format 'someone@something.com"));
      }
    } else {
      emit(UserLogInErrorState(msg: "Make sure you input all fields."));
    }
  }

  FutureOr<void> viewProfile(
      ViewProfileEvent event, Emitter<UserState> emit) async {
    emit(ShowUserInfoLoadingState());
    try {
      final user =
          await UserService().viewProfile(bearerToken: event.bearerToken);
      emit(ShowUserInfoState(user: user));
    } catch (e) {
      emit(UserInfoShowErrorState(msg: "Error Showing user Info"));
    }
  }

  FutureOr<void> pickProfilePicture(
      PickProfilePictureEvent event, Emitter<UserState> emit) async {
    final String imageUrl = await locator.getImage();
    if (imageUrl.isNotEmpty) {
      locator.currentImagePath = imageUrl;
      emit(ImagePickedState(imagePath: locator.currentImagePath));
    }
  }

  FutureOr<void> signout(UserSignoutEvent event, Emitter<UserState> emit) {
    locator.currentPageIndex = 0;
    locator.currentBearerToken = "";
    locator.currentImagePath = "https://www.nicepng.com/png/full/73-730154_open-default-profile-picture-png.png";
    locator.categoryList = [];
    locator.productList = [];
    locator.cartList = [];
    emit(UserSignedOutState(msg: "${event.name} Signed out, see you soon ${event.name}."));
  }
}
