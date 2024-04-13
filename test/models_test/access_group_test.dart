import 'package:flutter_test/flutter_test.dart';
import 'package:uah_shelters/src/models/access_group.dart';

void main() {
  group('AccessGroup Serialization Tests', () {
    test('AccessGroup fromJson/toJson', () {
      // Define a sample AccessGroup
      final accessGroup = AccessGroup(
        uuid: "unique-id-123",
        accountUUID: "account-id-456",
        name: "Sample Group",
        user: CRUD(create: true, read: true, update: false, delete: true),
        group: CRUD(create: false, read: true, update: true, delete: false),
        shelter: CRUD(create: true, read: false, update: true, delete: false),
        animal: CRUD(create: false, read: false, update: false, delete: true),
        animalTreatment: CRUD(create: true, read: true, update: true, delete: false),
        animalMedicalDocs: CRUD(create: false, read: true, update: false, delete: true),
      );

      // Serialize to JSON
      final json = accessGroup.toJson();

      // Deserialize from JSON
      final newAccessGroup = AccessGroup.fromJson(json);

      // Verify all fields
      expect(newAccessGroup.uuid, equals(accessGroup.uuid));
      expect(newAccessGroup.accountUUID, equals(accessGroup.accountUUID));
      expect(newAccessGroup.name, equals(accessGroup.name));

      // Check CRUD fields
      expect(newAccessGroup.user.toInt(), equals(accessGroup.user.toInt()));
      expect(newAccessGroup.group.toInt(), equals(accessGroup.group.toInt()));
      expect(newAccessGroup.shelter.toInt(), equals(accessGroup.shelter.toInt()));
      expect(newAccessGroup.animal.toInt(), equals(accessGroup.animal.toInt()));
      expect(newAccessGroup.animalTreatment.toInt(), equals(accessGroup.animalTreatment.toInt()));
      expect(newAccessGroup.animalMedicalDocs.toInt(), equals(accessGroup.animalMedicalDocs.toInt()));

      // Additional detailed checks for CRUD fields
      // User CRUD checks
      expect(newAccessGroup.user.create, accessGroup.user.create);
      expect(newAccessGroup.user.read, accessGroup.user.read);
      expect(newAccessGroup.user.update, accessGroup.user.update);
      expect(newAccessGroup.user.delete, accessGroup.user.delete);

      // Group CRUD checks
      expect(newAccessGroup.group.create, accessGroup.group.create);
      expect(newAccessGroup.group.read, accessGroup.group.read);
      expect(newAccessGroup.group.update, accessGroup.group.update);
      expect(newAccessGroup.group.delete, accessGroup.group.delete);
    });
  });
}
