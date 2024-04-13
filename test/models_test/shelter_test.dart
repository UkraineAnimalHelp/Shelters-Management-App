import 'package:flutter_test/flutter_test.dart';
import 'package:uah_shelters/src/models/shelter.dart';

void main() {
  group('Shelter Serialization Tests', () {
    test('Shelter fromJson/toJson', () {
      // Define a sample Shelter
      final shelter = Shelter(
        uuid: "uuid-123",
        accountUUID: "account-uuid-456",
        name: "Happy Tails Shelter",
        phones: ["123-456-7890", "098-765-4321"],
      );

      // Serialize to JSON
      final json = shelter.toJson();

      // Deserialize from JSON
      final newShelter = Shelter.fromJson(json);

      // Verify all fields
      expect(newShelter.uuid, equals(shelter.uuid));
      expect(newShelter.accountUUID, equals(shelter.accountUUID));
      expect(newShelter.name, equals(shelter.name));
      expect(newShelter.phones, equals(shelter.phones));
    });
  });
}
