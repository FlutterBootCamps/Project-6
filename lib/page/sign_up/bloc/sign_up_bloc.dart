import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_store/helper/getImage.dart';
import 'package:my_store/model/user_model.dart';
import 'package:my_store/service/networking_upload.dart';
import 'package:my_store/service/networking_user.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  NetworkingUser networkingUser=NetworkingUser();
  String token="";
  bool isSelected = false;
  String? urlImage;
  String? pathImage;
  TextEditingController? controllerName = TextEditingController();
  TextEditingController? controllerEmail = TextEditingController();
  TextEditingController? controllerPassword = TextEditingController();
  String name="";
  String email="";
  final String password="";
  final String image="";
  late Future<User> userToShow=networkingUser.Profile(token:token);
  SignUpBloc() : super(SignUpInitial()) {
    on<ChangeImageEvent>((event, emit) async {
      try {
        final path = await getImage();
        pathImage = path;
        isSelected = true;
        emit(UpdateImageState());
      } catch (error) {
        isSelected = false;
        pathImage = null;
        emit(UpdateImageState());
      }
    });
    on<CreateAccountEvent>((event, emit) async {
      try {
        emit(LoadingState());

        final netWorkeing = NetWorkingUpload();
        final urlImageServer =
            await netWorkeing.uploadImageMethod(path: pathImage!);
        User user = User(
            email: controllerEmail?.text,
            name: controllerName?.text,
            password: controllerPassword?.text,
            avatar: urlImageServer.location);
        await networkingUser.CreateUser(user: user);
        emit(SuccessState());
      } catch (error) {
        print(error);
        emit(ErrorState());
      }
    });

    on<ShowProfileEvent>((event, emit) async {
      try {
        emit(LoadingState());
        final netWorkeing = NetworkingUser();
        final urlImageServer =
            await  netWorkeing.Profile(token:event.token);
            
            name= urlImageServer.name!;
            email= urlImageServer.email!;
            // avatar= urlImageServer.avatar;
        emit(ShowProfileState(user: User.fromJson(json.decode(urlImageServer as String))));
      } catch (error) {
        print(error);
        emit(ErrorState());
      }
    });




        on<UpdateUserEvent>((event, emit) async {
      try {
        emit(LoadingState());

        final netWorkeing = NetWorkingUpload();
        final urlImageServer =
            await netWorkeing.uploadImageMethod(path: pathImage!);
        print(urlImageServer.location);
        User user = User(
            email: controllerEmail?.text,
            name: controllerName?.text,
            password: controllerPassword?.text,
            avatar: urlImageServer.location);

        await NetworkingUser().updateUser(userData: user);
        emit(UpdateState());
      } catch (error) {
        print(error);
        emit(ErrorState());
      }
    });
  }
}
