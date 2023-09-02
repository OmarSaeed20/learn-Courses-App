// what dose the class depend on ?
// << Answer -->> AuthenticationRepository

// how we can create a fake version of the dependency
// << Answer -->> Using mocktail

// how we can control what our dependencies do
// << Answer -->> Using ths Mocktail 's APIs

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:learn/index.dart';

class MockAuthRepo extends Mock implements AuthenticationRepository {
  void main() {
    test(
      "should call [AuthRepo.createUser]",
      () async {
        // Arrange

        // Act

       // Assert
      },
    );
  }
}
