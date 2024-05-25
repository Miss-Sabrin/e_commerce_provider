import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:e_commerce_provider/model/user_model.dart';
import 'package:e_commerce_provider/screens/constant.dart';
import 'package:e_commerce_provider/utils/constants.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class UserServices {
  final box = GetStorage();
  Future<UserModel> login(
      {required String username, required String password}) async {
    var data = {"username": username, "password": password};
    var response = await http.post(
      Uri.parse("$kEndpoint/user/login"),
      body: jsonEncode(data),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      log(json.toString());
      await saveUser(UserModel.fromJson(json["data"]));
      return UserModel.fromJson(json["data"]);
    } else {
      final json = jsonDecode(response.body);
      throw json["error"];
    }
  }

  saveUser(UserModel user) {
    box.remove(kUserInfo);
    box.write(kUserInfo, user.toJson());
  }

  ///todo register
  Future<UserModel> register(
      {required String name,
      required String username,
      required String password,
      String? photo}) async {
    var data = {
      "username": username,
      "password": password,
      "name": name,
      "photo": photo
    };
    var response = await http.post(Uri.parse("$kEndpoint/user/register"),
        body: jsonEncode(data),
        headers: {HttpHeaders.contentTypeHeader: "application/json"});
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      log(json.toString());
      await saveUser(UserModel.fromJson(json["data"]));
      return UserModel.fromJson(json["data"]);
    } else {
      final json = jsonDecode(response.body);
      throw json["error"];
    }
  }
}
