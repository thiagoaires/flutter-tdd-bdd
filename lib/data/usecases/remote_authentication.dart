import 'package:fordev/data/http/http_client.dart';

import '../../domain/usecases/authentication.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({required this.httpClient, required this.url});

  Future<void> auth(AuthenticationParams params) async {
    final body = params.toJson();
    await httpClient.request(url: url, method: 'post', body: body);
  }
}
