import 'package:flutter_test/flutter_test.dart';
import 'package:uah_shelters/src/models/task.dart';

void main() {
  group('Task', () {
    test('should correctly serialize and deserialize', () {
      final task = Task(
        uuid: '123',
        type: TaskType.treatment,
        data: {'detail': 'Fix something'},
        accountUUID: 'acc-001',
        animalUUID: 'anim-001',
        treatmentUUID: 'treat-001',
        employeeUUID: 'emp-001',
        title: 'Repair Fence',
        body: 'The north fence needs to be repaired.',
        isDone: false,
        timestamp: DateTime.parse('2023-04-12T14:30:00Z'),
        ttl: DateTime.parse('2023-04-12T14:30:00Z'),
      );

      // Convert to JSON
      final json = task.toJson();
      
      // Convert from JSON
      final newTask = Task.fromJson(json);

      // Check if the new object matches the original
      expect(newTask.uuid, equals(task.uuid));
      expect(newTask.type, equals(task.type));
      expect(newTask.data, equals(task.data));
      expect(newTask.accountUUID, equals(task.accountUUID));
      expect(newTask.animalUUID, equals(task.animalUUID));
      expect(newTask.treatmentUUID, equals(task.treatmentUUID));
      expect(newTask.employeeUUID, equals(task.employeeUUID));
      expect(newTask.title, equals(task.title));
      expect(newTask.body, equals(task.body));
      expect(newTask.isDone, equals(task.isDone));
      expect(newTask.timestamp, equals(task.timestamp));
      expect(newTask.ttl, equals(task.ttl));
    });
  });
}
