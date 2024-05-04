import 'package:flutter_test/flutter_test.dart';
import 'package:uah_shelters/src/models/account.dart';

void main() {
  group('Account Serialization Tests', () {
    test('Account fromJson/toJson', () {
      // Define a sample Account
      final account = Account(
        uuid: "uuid-123",
        ownerUUID: "1133-444",
        organizationName: "OpenAI",
      );

      // Serialize to JSON
      final json = account.toJson();

      // Deserialize from JSON
      final newAccount = Account.fromJson(json);

      // Verify all fields
      expect(newAccount.uuid, equals(account.uuid));
      expect(newAccount.organizationName, equals(account.organizationName));
    });
  });
}
