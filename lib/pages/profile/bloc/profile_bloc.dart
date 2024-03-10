import 'package:api_page_lab/controller/profile_controller.dart';
import 'package:api_page_lab/models/user_model.dart';
import 'package:api_page_lab/services/setup.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final profileController = locater.get<ProfileController>();
  ProfileBloc() : super(ProfileInitial()) {
    on<FetchProfileEvent>((event, emit) async {
      emit(LoadingState());
      UserModel? user = await profileController.getProfile();

      if(user == null){
        emit(ErrorState());
      }else{
        emit(SuccessState(userModel: user));
      }

    });
  }
}
