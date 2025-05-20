import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({required this.httpClient, required this.url});

  Future<void> auth() async {
    await httpClient.request(url: url);
  }
}

abstract class HttpClient {
  Future<void> request({required String url});
}

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  test('Should call HTTP client with correct URL', () async {
    // arrange
    final HttpClient httpClient = HttpClientMock();
    final url = faker.internet.httpUrl();
    final sut = RemoteAuthentication(httpClient: httpClient, url: url);

    when(httpClient.request(url: url)).thenAnswer((_) async => {});

    // act

    await sut.auth();

    // assert

    verify(httpClient.request(url: url));
  });
}
