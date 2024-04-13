import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uah_shelters/src/models/animal.dart';

void main() {
  group('Animal Serialization Tests', () {
    test('Animal fromJson/toJson test', () {
      final date = DateTime.now();
      const timeOfDay = TimeOfDay(hour: 8, minute: 30);

      // Create an instance of Animal
      final animal = Animal(
        uuid: "123",
        accountUUID: "456",
        inShelter: "Shelter 1",
        name: "Buddy",
        assignedToEmployees: ["Test"],
        birthday: date,
        gender: Gender.male,
        type: AnimalType.dog,
        added: date,
        notes: [
          Note(
              date: date,
              title: "General Checkup",
              notes: "Animal is healthy and active.")
        ],
        tags: ["Tag 1", "Tag 2"],
        photoPath: "path/to/photo.jpg",
        weights: [Metric(date: date, value: 20.0)],
        temperatures: [Metric(date: date, value: 38.5)],
        treatments: [
          Treatment(
            name: "Deworming",
            notes: "Test",
            start: date,
            end: date.add(const Duration(days: 10)),
            timesOfDay: [timeOfDay],
            repeatEveryDays: 30,
          )
        ],
        vaccinations: [
          Vaccination(date: date, name: "Rabies", notes: "Annual vaccination")
        ],
        photos: [
          Photo(date: date, path: "path/to/photo.jpg", notes: "Cute photo")
        ],
      );

      // Convert to JSON
      final json = animal.toJson();

      // Convert from JSON
      final newAnimal = Animal.fromJson(json);

      // Check if the new object matches the original
      expect(newAnimal.uuid, animal.uuid);
      expect(newAnimal.accountUUID, animal.accountUUID);
      expect(newAnimal.inShelter, animal.inShelter);
      expect(newAnimal.name, animal.name);
      expect(newAnimal.assignedToEmployees, animal.assignedToEmployees);
      expect(newAnimal.birthday, animal.birthday);
      expect(newAnimal.added, animal.added);
      expect(newAnimal.gender, animal.gender);
      expect(newAnimal.type, animal.type);
      expect(newAnimal.notes!.first.date, animal.notes!.first.date);
      expect(newAnimal.notes!.first.title, animal.notes!.first.title);
      expect(newAnimal.notes!.first.notes, animal.notes!.first.notes);
      expect(newAnimal.tags, animal.tags);
      expect(newAnimal.photoPath, animal.photoPath);
      expect(newAnimal.weights!.first.date, animal.weights!.first.date);
      expect(newAnimal.weights!.first.value, animal.weights!.first.value);
      expect(newAnimal.temperatures!.first.date, animal.temperatures!.first.date);
      expect(newAnimal.temperatures!.first.value, animal.temperatures!.first.value);
      expect(newAnimal.treatments!.first.name, animal.treatments!.first.name);
      expect(newAnimal.treatments!.first.notes, animal.treatments!.first.notes);
      expect(newAnimal.treatments!.first.start, animal.treatments!.first.start);
      expect(newAnimal.treatments!.first.end, animal.treatments!.first.end);
      expect(newAnimal.treatments!.first.timesOfDay.first.hour, animal.treatments!.first.timesOfDay.first.hour);
      expect(newAnimal.treatments!.first.timesOfDay.first.minute, animal.treatments!.first.timesOfDay.first.minute);
      expect(newAnimal.treatments!.first.repeatEveryDays, animal.treatments!.first.repeatEveryDays);
      expect(newAnimal.vaccinations!.first.date, animal.vaccinations!.first.date);
      expect(newAnimal.vaccinations!.first.name, animal.vaccinations!.first.name);
      expect(newAnimal.vaccinations!.first.notes, animal.vaccinations!.first.notes);
      expect(newAnimal.photos!.first.date, animal.photos!.first.date);
      expect(newAnimal.photos!.first.path, animal.photos!.first.path);
      expect(newAnimal.photos!.first.notes, animal.photos!.first.notes);
    });
  });
}
