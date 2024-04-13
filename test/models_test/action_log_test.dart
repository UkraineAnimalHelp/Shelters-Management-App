import 'package:flutter_test/flutter_test.dart';
import 'package:uah_shelters/src/models/action_log.dart';

void main() {
  group('ActionLogs', () {
    test('should correctly serialize and deserialize', () {
      final actionLogs = ActionLog(
        uuid: 'log123',
        accountUUID: 'acc-002',
        action: 'Feed Animals',
        animalUUID: 'anim-002',
        shelterName: 'Shelter A',
        employeeName: 'John Doe',
        datetime: DateTime.parse('2023-04-12T12:00:00Z'),
        ttl: DateTime.parse('2023-04-19T12:00:00Z'),
      );

      // Convert to JSON
      final json = actionLogs.toJson();
      
      // Convert from JSON
      final newActionLogs = ActionLog.fromJson(json);

      // Check if the new object matches the original
      expect(newActionLogs.uuid, equals(actionLogs.uuid));
      expect(newActionLogs.accountUUID, equals(actionLogs.accountUUID));
      expect(newActionLogs.action, equals(actionLogs.action));
      expect(newActionLogs.animalUUID, equals(actionLogs.animalUUID));
      expect(newActionLogs.shelterName, equals(actionLogs.shelterName));
      expect(newActionLogs.employeeName, equals(actionLogs.employeeName));
      expect(newActionLogs.datetime, equals(actionLogs.datetime));
      expect(newActionLogs.ttl, equals(actionLogs.ttl));
    });
  });
}
