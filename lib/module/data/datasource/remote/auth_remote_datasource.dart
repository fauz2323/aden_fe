import 'dart:convert';

import 'package:aden_fe/core/error/failure_core.dart';
import 'package:aden_fe/core/helper/api_helper.dart';
import 'package:aden_fe/module/data/model/login_model.dart';
import 'package:aden_fe/module/data/model/profile_model.dart';
import 'package:aden_fe/module/data/model/register_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract class AuthRemoteDatasource {
  Future<Either<Failure, LoginModel>> login(String email, String password);

  Future<Either<Failure, ProfileModel>> auth(String token);

  Future<Either<Failure, RegisterModel>> register(
      String name, String email, String phone, String password);
}

@Injectable()
class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  @override
  Future<Either<Failure, LoginModel>> login(
      String email, String password) async {
    // TODO: implement login

    Map body = {
      'email': email,
      'password': password,
    };

    final request = await http
        .post(
          ApiHelper.login,
          body: body,
          headers: ApiHelper.getHeaderPost('-'),
        )
        .timeout(
          Duration(seconds: 10),
          onTimeout: () => ApiHelper.timeOutException(),
        );

    if (request.statusCode != 200) {
      return left(
        Failure(
          message: jsonDecode(request.body)['message'],
          code: request.statusCode,
        ),
      );
    }

    return right(LoginModel.fromJson(jsonDecode(request.body)));
  }

  @override
  Future<Either<Failure, RegisterModel>> register(
      String name, String email, String phone, String password) async {
    Map body = {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone
    };

    final request = await http
        .post(
          ApiHelper.register,
          body: body,
          headers: ApiHelper.getHeaderPost('-'),
        )
        .timeout(
          Duration(seconds: 10),
          onTimeout: () => ApiHelper.timeOutException(),
        );

    if (request.statusCode != 200) {
      return left(
        Failure(
          message: jsonDecode(request.body)['message'],
          code: request.statusCode,
        ),
      );
    }

    return right(RegisterModel.fromJson(jsonDecode(request.body)));
  }

  @override
  Future<Either<Failure, ProfileModel>> auth(String token) async {
    final request = await http
        .get(
          ApiHelper.auth,
          headers: ApiHelper.getHeaderGet(token),
        )
        .timeout(
          Duration(seconds: 10),
          onTimeout: () => ApiHelper.timeOutException(),
        );

    if (request.statusCode != 200) {
      return left(
        Failure(
          message: jsonDecode(request.body)['message'],
          code: request.statusCode,
        ),
      );
    }

    return right(ProfileModel.fromJson(jsonDecode(request.body)));
  }
}
