import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restandmvvm/models/login_model.dart';
import 'package:restandmvvm/services/api_services.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiService authService = ApiService();

  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        final loginModel =
            LoginModel(email: event.email, password: event.password);
        final response = await authService.postLogin(loginModel);

        if (response != null && response.statusCode == 200) {
          final data = response.data;
          final token = data['token'];

          // Lakukan sesuatu dengan token, misalnya menyimpannya atau melakukan navigasi
          yield LoginSuccess(token: token);
        } else {
          final error = response.data['error']
              as String; // Ubah sesuai dengan struktur respons server Anda

          yield LoginFailure(error: 'Login failed');
        }
      } catch (e) {
        yield LoginFailure(error: 'Error: $e');
      }
    }
  }
}
