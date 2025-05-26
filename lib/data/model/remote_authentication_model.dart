import 'package:fordev/data/http/http_client.dart';

import '../../domain/usecases/authentication.dart';

class RemoteAuthenticationModel {
  final HttpClient httpClient;
  final String url;

  RemoteAuthenticationModel({required this.httpClient, required this.url});

  Future<void> auth(AuthenticationParams params) async {
    final body = RemoteAuthenticationParams.fromDomain(params).toJson();
    await httpClient.request(url: url, method: 'post', body: body);
  }
}

class RemoteAuthenticationParams {
  final String email;
  final String password;

  RemoteAuthenticationParams({required this.email, required this.password});

  factory RemoteAuthenticationParams.fromDomain(AuthenticationParams entity) =>
      RemoteAuthenticationParams(
        email: entity.email,
        password: entity.password,
      );

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}
