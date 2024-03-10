import 'dart:async';

import 'package:api_lab/model/user_model.dart';
import 'package:api_lab/services/user_api/user_services.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {});
    on<ProfileLoadDataEvent>(loadDataMethod);
    on<ProfileEditEvent>(updateProfile);
  }

  FutureOr<void> loadDataMethod(
      ProfileLoadDataEvent event, Emitter<ProfileState> emit) async {
    String token = event.tokenKey;
    try {
      emit(ProfileLoadingState());
      UserModel loadData = await UserServices().getUserProfile(token: token);

      emit(ProfileLoadState(user: loadData));
    } catch (e) {
      emit(ProfileErrorState());
    }
  }

  FutureOr<void> updateProfile(
      ProfileEditEvent event, Emitter<ProfileState> emit) async {
    try {
      emit(ProfileLoadingState());
      event.user.name = event.name;
      UserModel loadData =
          await UserServices().getUpdateUserProfile(user: event.user);

      emit(ProfileLoadState(user: loadData));
    } catch (e) {
      emit(ProfileErrorState());
    }
  }
}
