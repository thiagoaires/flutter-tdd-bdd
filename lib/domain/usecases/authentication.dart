import '../entities/account_entity.dart';

abstract class Authentication {
  Future<AccountEntity> auth({required RemoteAuthenticationParams params});
}

class RemoteAuthenticationParams {
  final String email;
  final String password;

  RemoteAuthenticationParams({required this.email, required this.password});

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}
