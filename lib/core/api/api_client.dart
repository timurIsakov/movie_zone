import 'dart:convert';

import 'package:http/http.dart';

import '../../features/auth/data/datasources/auth_local_data_source.dart';
import 'api_exception.dart';
import 'constants/api_constants.dart';

abstract class ApiClient {
  Future<dynamic> get(String path, Map<String, dynamic> params);
  Future<dynamic> post(String path, Map<String, dynamic> data);
  Future<dynamic> patch(String path, Map<String, dynamic> data);
  Future<dynamic> delete(String path);
}

class ApiClientImpl extends ApiClient {
  final AuthLocalDataSource localDataSource;
  final Client client;

  ApiClientImpl(this.client, this.localDataSource);

  @override
  Future get(String path, Map<String, dynamic> params) async {
    String? token = await localDataSource.getSessionId();

    final Map<String, String> header = {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    };

    final response =
        await client.get(getPath(path, params: params), headers: header);

    return _errorHandler(response);
  }

  @override
  Future delete(String path) async {
    String? token = await localDataSource.getSessionId();

    final Map<String, String> header = {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    };

    final Response response = await client.delete(
      getPath(path),
      headers: header,
    );
    return _errorHandler(response);
  }

  @override
  Future patch(String path, Map<String, dynamic> data) async {
    String? token = await localDataSource.getSessionId();

    final Map<String, String> header = {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    };

    final Response response = await client.patch(
      getPath(path),
      headers: header,
      body: jsonEncode(data),
    );
    return _errorHandler(response);
  }

  @override
  Future post(String path, Map<String, dynamic> data) async {
    String? token = await localDataSource.getSessionId();

    final Map<String, String> header = {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    };

    final Response response = await client.post(
      getPath(path),
      headers: header,
      body: jsonEncode(data),
    );
    return _errorHandler(response);
  }

  _errorHandler(Response response) {
    if (response.statusCode == 200) {
      return json.decode(utf8.decode(response.bodyBytes));
    } else if (response.statusCode == 400 || response.statusCode == 404) {
      String msg = "unknown_error";
      var resp = jsonDecode(utf8.decode(response.bodyBytes));

      if (resp.containsKey("error")) {
        msg = resp["error"];
      } else if (resp.containsKey("message")) {
        var rsp = resp["message"];
        if (rsp.runtimeType == String) msg = resp["message"];
        if (rsp.runtimeType == List) msg = rsp[0];
      } else {
        msg = utf8
            .decode(response.bodyBytes)
            .replaceAll("[", '')
            .replaceAll("]", '')
            .replaceAll("}", '')
            .replaceAll("{", '')
            .replaceAll("\\", '');
      }
      throw ExceptionWithMessage(msg);
    } else if (response.statusCode == 401) {
      throw UnauthorisedException();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Uri getPath(String path, {Map<dynamic, dynamic>? params}) {
    var paramsString = '';
    if (params?.isNotEmpty ?? false) {
      params?.forEach((key, value) {
        paramsString += '&$key=$value';
      });
    }

    return Uri.parse('${ApiConstants.baseApiUrl}$path$paramsString');
  }
}
