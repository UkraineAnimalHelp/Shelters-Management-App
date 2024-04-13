import 'package:flutter/material.dart';

enum Gender {
  male,
  female;

  String toJson() => name;
  static Gender fromJson(String json) => values.byName(json);
}

enum AnimalType {
  cat,
  dog,
  bird,
  reptile,
  other;

  String toJson() => name;
  static AnimalType fromJson(String json) => values.byName(json);
}

class Metric {
  DateTime date;
  double value;

  Metric({required this.date, required this.value});

  factory Metric.fromJson(dynamic json) {
    return Metric(
      date: DateTime.parse(json['date']),
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'value': value,
    };
  }
}

class Note {
  DateTime date;
  String title;
  String notes;

  Note({required this.date, required this.title, required this.notes});

  factory Note.fromJson(dynamic json) {
    return Note(
      date: DateTime.parse(json['date']),
      title: json['title'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'title': title,
      'notes': notes,
    };
  }
}

class Photo {
  DateTime date;
  String path;
  String? notes;

  Photo({required this.date, required this.path, this.notes});

  factory Photo.fromJson(dynamic json) {
    return Photo(
      date: DateTime.parse(json['date']),
      path: json['path'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'path': path,
      'notes': notes,
    };
  }
}

class Treatment {
  String name;
  String? notes;
  DateTime start;
  DateTime? end;
  List<TimeOfDay> timesOfDay;
  int repeatEveryDays;

  Treatment({
    required this.name,
    this.notes,
    required this.start,
    this.end,
    required this.timesOfDay,
    required this.repeatEveryDays,
  });

  factory Treatment.fromJson(dynamic json) {
    var times = json['timesOfDay'] as List<dynamic>;
    return Treatment(
      name: json['name'],
      notes: json['notes'],
      start: DateTime.parse(json['start']),
      end: json['end'] != null ? DateTime.parse(json['end']) : null,
      timesOfDay: times
          .map((t) => TimeOfDay(hour: t['hour'], minute: t['minute']))
          .toList(),
      repeatEveryDays: json['repeatEveryDays'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'notes': notes,
      'start': start.toIso8601String(),
      'end': end?.toIso8601String(),
      'timesOfDay':
          timesOfDay.map((t) => {'hour': t.hour, 'minute': t.minute}).toList(),
      'repeatEveryDays': repeatEveryDays,
    };
  }
}

class Vaccination {
  DateTime date;
  String name;
  String? notes;

  Vaccination({
    required this.date,
    required this.name,
    this.notes,
  });

  factory Vaccination.fromJson(dynamic json) {
    return Vaccination(
      date: DateTime.parse(json['date']),
      name: json['name'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'name': name,
      'notes': notes,
    };
  }
}

class Animal {
  String uuid;
  String accountUUID;
  String inShelter;
  String name;
  Gender gender;
  AnimalType type;
  DateTime birthday;
  DateTime added;
  DateTime? died;
  DateTime? adopted;
  String? photoPath;
  List<Note>? notes;
  List<String>? tags;
  List<String>? assignedToEmployees;
  List<Metric>? weights;
  List<Metric>? temperatures;
  List<Treatment>? treatments;
  List<Vaccination>? vaccinations;
  List<Photo>? photos;

  Animal({
    required this.uuid,
    required this.accountUUID,
    required this.inShelter,
    required this.name,
    required this.birthday,
    required this.gender,
    required this.type,
    required this.added,
    this.died,
    this.adopted,
    this.notes,
    this.tags,
    this.photoPath,
    this.weights,
    this.temperatures,
    this.treatments,
    this.vaccinations,
    this.photos,
    this.assignedToEmployees,
  });

  factory Animal.fromJson(dynamic json) {
    return Animal(
      uuid: json['uuid'],
      accountUUID: json['accountUUID'],
      inShelter: json['inShelter'],
      name: json['name'],
      notes: json['notes'] != null ? (json['notes'] as List).map((e) => Note.fromJson(e)).toList() : null,
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
      photoPath: json['photoPath'],
      assignedToEmployees: json['assignedToEmployees'] != null ? List<String>.from(json['assignedToEmployees']) : null,
      birthday: DateTime.parse(json['birthday']),
      added: DateTime.parse(json['added']),
      adopted: json['adopted'] != null ? DateTime.parse(json['adopted']) : null,
      died: json['died'] != null ?  DateTime.parse(json['died']) : null,
      gender: Gender.fromJson(json['gender']),
      type: AnimalType.fromJson(json['type']),
      weights: json['weights'] != null
          ? (json['weights'] as List).map((e) => Metric.fromJson(e)).toList()
          : null,
      temperatures: json['temperatures'] != null
          ? (json['temperatures'] as List)
              .map((e) => Metric.fromJson(e))
              .toList()
          : null,
      treatments: json['treatments'] != null
          ? (json['treatments'] as List)
              .map((e) => Treatment.fromJson(e))
              .toList()
          : null,
      vaccinations: json['vaccinations'] != null
          ? (json['vaccinations'] as List)
              .map((e) => Vaccination.fromJson(e))
              .toList()
          : null,
      photos: json['photos'] != null
          ? (json['photos'] as List).map((e) => Photo.fromJson(e)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'accountUUID': accountUUID,
      'inShelter': inShelter,
      'name': name,
      'notes': notes?.map((e) => e.toJson()).toList(),
      'tags': tags,
      'photoPath': photoPath,
      'birthday': birthday.toIso8601String(),
      'added': added.toIso8601String(),
      'adopted': adopted?.toIso8601String(),
      'died': died?.toIso8601String(),
      'gender': gender.toJson(),
      'type': type.toJson(),
      'assignedToEmployees': assignedToEmployees,
      'weights': weights?.map((e) => e.toJson()).toList(),
      'temperatures': temperatures?.map((e) => e.toJson()).toList(),
      'treatments': treatments?.map((e) => e.toJson()).toList(),
      'vaccinations': vaccinations?.map((e) => e.toJson()).toList(),
      'photos': photos?.map((e) => e.toJson()).toList(),
    };
  }
}
