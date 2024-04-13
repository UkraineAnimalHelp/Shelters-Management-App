import 'package:flutter_test/flutter_test.dart';
import 'package:uah_shelters/src/models/employee.dart';

void main() {
  group('Employee Serialization Tests', () {
    test('Employee fromJson/toJson', () {
      // Define a sample Employee
      final employee = Employee(
        uuid: "uuid-123",
        accountUUID: "account-uuid-456",
        firstName: "John",
        lastName: "Doe",
        photoPath: "path/to/photo.jpg",
        isOwner: true,
        phones: ["123-456-7890", "098-765-4321"],
        links: ["http://example.com"],
        inShelters: ["shelter1", "shelter2"],
        inAccessGroups: ["group1", "group2"],
      );

      // Serialize to JSON
      final json = employee.toJson();

      // Deserialize from JSON
      final newEmployee = Employee.fromJson(json);

      // Verify all fields
      expect(newEmployee.uuid, equals(employee.uuid));
      expect(newEmployee.accountUUID, equals(employee.accountUUID));
      expect(newEmployee.firstName, equals(employee.firstName));
      expect(newEmployee.lastName, equals(employee.lastName));
      expect(newEmployee.photoPath, equals(employee.photoPath));
      expect(newEmployee.isOwner, equals(employee.isOwner));
      expect(newEmployee.phones, equals(employee.phones));
      expect(newEmployee.links, equals(employee.links));
      expect(newEmployee.inShelters, equals(employee.inShelters));
      expect(newEmployee.inAccessGroups, equals(employee.inAccessGroups));
    });
  });
}
