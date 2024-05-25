import 'package:e_commerce_provider/model/user_model.dart';
import 'package:e_commerce_provider/services/user.dart';
import 'package:e_commerce_provider/utils/constants.dart';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

enum LoginState { normal, loading, error, networkError, success }

enum RegisterState { normal, loading, error, networkError, success }

class UserProvider extends ChangeNotifier {
  UserModel user = UserModel();
  LoginState loginState = LoginState.normal;
  RegisterState registerState = RegisterState.normal;

  final box = GetStorage();
  login({
    required String username,
    required String password,
    Function(UserModel)? onSuccess,
    Function(String)? onError,
  }) async {
    try {
      loginState = LoginState.loading;
      notifyListeners();
      user = await UserServices().login(username: username, password: password);
      loginState = LoginState.success;
      notifyListeners();
      if (onSuccess != null) {
        onSuccess(user);
      }
    } catch (e) {
      loginState = LoginState.error;
      notifyListeners();
      if (onError != null) {
        onError(e.toString());
      }
    }
  }

  ///todo register

  register({
    required String name,
    required String username,
    required String password,
    String? photo,
    Function(UserModel)? onSuccess,
    Function(String)? onError,
  }) async {
    try {
      registerState = RegisterState.loading;
      notifyListeners();
      user = await UserServices()
          .register(name: name, username: username, password: password);
      registerState = RegisterState.success;
      notifyListeners();
      if (onSuccess != null) {
        onSuccess(user);
      }
    } catch (error) {
      loginState = LoginState.error;
      if (onError != null) {
        onError(error.toString());
      }
    }
  }

  getUser() {
    if (box.hasData(kUserInfo)) {
      final json = box.read(kUserInfo);
      if (json != null) {
        user = UserModel.fromJson(json);
        notifyListeners();
      }
    }
  }
}
