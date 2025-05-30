import 'package:faker/faker.dart';
import 'package:fordev/data/http/http_client.dart';
import 'package:fordev/data/model/remote_authentication_model.dart';
import 'package:fordev/domain/usecases/authentication.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late HttpClient httpClient;
  late String url;
  late RemoteAuthentication sut;
  setUp(() {
    httpClient = HttpClientMock();
    url = faker.internet.httpUrl();
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
  });
  test('Should call HTTP client with correct URL and method', () async {
    // arrange
    final params = AuthenticationParams(
      email: faker.internet.email(),
      password: faker.internet.password(),
    );
    // act

    when(
      () => httpClient.request(
        url: url,
        method: 'post',
        body: any(named: 'body'),
      ),
    ).thenAnswer((_) async => {});
    await sut.auth(params);

    // assert

    verify(
      () => httpClient.request(
        url: url,
        method: 'post',
        body: {'email': params.email, 'password': params.password},
      ),
    ).called(1);
  });

  // test('Should throw Unexpect error if HTTP client returns 400', () async {
  //   when(
  //     () => httpClient.request(url: any(), method: any(), ),
  //   ).thenThrow(throwable: Exception('Bad Request'));
  //   // arrange
  // });
}
