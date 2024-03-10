import 'dart:async';

import 'package:api_lab/extensions/helper/get_image.dart';
import 'package:api_lab/model/user_model.dart';
import 'package:api_lab/services/user_api/user_services.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  bool isSelected = false;
  String? pathImage;
  SignupBloc() : super(SignupInitial()) {
    on<CreateUserEvent>(methodCreateUser);
    on<UploadImageEvent>(methodUpload);
  }

  FutureOr<void> methodCreateUser(
      CreateUserEvent event, Emitter<SignupState> emit) async {
    String name = event.userName;
    String email = event.email;
    String password = event.password;

    try {
      final urlImageServer = await UserServices().uploadAvatar(path: pathImage!);
      UserModel newUser = await UserServices().createUser(
          name: name,
          email: email,
          password: password,
          avatar: urlImageServer!.location!);

      if (newUser.name != null &&
          newUser.email != null &&
          newUser.password != null) {
        emit(SignupSuccessState(msg: "User added Successful"));
      } else {
        emit(SignupErrorState(msg: "Error filling the require field"));
      }
    } catch (e) {
      emit(SignupErrorState(msg: "Error"));
    }
  }

  FutureOr<void> methodUpload(
      UploadImageEvent event, Emitter<SignupState> emit) async {
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
  }
}
