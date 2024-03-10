abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {}

class LoginAccountEvent extends LoginEvent{
  final String email;
  final String password;
  LoginAccountEvent(this.email, this.password);
}
