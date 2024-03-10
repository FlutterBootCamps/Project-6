import 'package:api_app/helper/getImage.dart';
import 'package:api_app/models/user_models.dart';
import 'package:api_app/network/auth_api.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  bool isSelected = false;
  String? urlImage;
  String? pathImage;
  TextEditingController? controllerName = TextEditingController();
  TextEditingController? controllerEmail = TextEditingController();
  TextEditingController? controllerPassword = TextEditingController();
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

        final netWorkeing = LoginApi();
        final urlImageServer =
            await netWorkeing.uploadImageMethod(path: pathImage!);
        print(urlImageServer.location);
        UserModel user = UserModel(
            email: controllerEmail?.text,
            name: controllerName?.text,
            password: controllerPassword?.text,
            avatar: urlImageServer.location);

        // await netWorkeing.signUpMethod(user: user);
        emit(SuccessState());
      } catch (error) {
        print(error);
        emit(ErrorState());
      }
    });
  }
}
