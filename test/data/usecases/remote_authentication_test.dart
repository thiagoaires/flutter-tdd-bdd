import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({required this.httpClient, required this.url});

  Future<void> auth() async {
    await httpClient.request(url: url, method: 'post');
  }
}

abstract class HttpClient {
  Future<void> request({required String url, required String method});
}

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

    // act

    when(
      () => httpClient.request(url: url, method: 'post'),
    ).thenAnswer((_) async => {});
    await sut.auth();

    // assert

    verify(() => httpClient.request(url: url, method: 'post')).called(1);
  });
}
