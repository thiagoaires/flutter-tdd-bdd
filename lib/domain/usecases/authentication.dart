import '../entities/account_entity.dart';

abstract class Authentication {
  Future<AccountEntity> auth({required AuthenticationParams params});
}

class AuthenticationParams {
  final String email;
  final String password;

  AuthenticationParams({required this.email, required this.password});
}
