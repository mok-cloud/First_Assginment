import 'dart:io';

List<Person> persons = [];
List<Doctor> doctors = [];

abstract class Person {
  static int _counter = 1;

  final int id;

  late String name;
  late String department;

  Person({required this.id, required this.name, required this.department});

  void printDetail();

  static int generateID() {
    return _counter++;
  }

  bool hasID(int personID) {
    return this.id == personID;
  }
}

class Student extends Person {
  late int age;
  late int level;
  late double _degree;

  double get deg => _degree;

  set SetDeg(double StudentDEG) {
    if (StudentDEG >= 0 && StudentDEG <= 100) {
      _degree = StudentDEG;
    } else {
      throw Exception("DEG must be between 0 and 100");
    }
  }

  Student({
    required super.id,
    required super.name,
    required super.department,
    required this.age,
    required this.level,
    required double StudentDEG,
  }){
    this.SetDeg=StudentDEG;
  }

  Student.Guest()
    : this.age = 0,
      this.level = 1,
      this._degree = 0.0,
      super(id: 0, name: "Unknown", department: "Unknown");
  @override
  void printDetail() {
    print(
      'Student:ID:${super.id} | Name:${super.name} | Department:${super.department} | Age:${this.age} | Level:${this.level} | Degree:${this._degree}',
    );
  }
}

class Doctor extends Person {
  late int age;
  late int Salary;
  Doctor({
    required super.id,
    required super.name,
    required super.department,
    required this.age,
    required this.Salary,
  });
  @override
  void printDetail() {
    print(
      'Doctor:ID:${super.id} | Name:${super.name} | Department:${super.department} | Age:${this.age} | Salary:${this.Salary}',
    );
  }
}

void main() {
  print("Welcome to Student Management System");
  String appName = "Student Managment";
  print(appName);
  bool work = true;
  while (work) {
    showMessage();
    String number = stdin.readLineSync() ?? "";
    switch (number) {
      case "1":
        AddStudent();
        break;

      case "2":
        RemoveStudent();
        break;

      case "3":
        ShowStudent();
        break;

      case "4":
        findStudent();
        break;

      case "5":
        AddgueStstudent();
        break;

      case"6":
        AddTeacher();
        break;

      case "7":
        work = false;
        break;

      default:
        print("Invalid Number:");
        break;
    }
  }
}

void showMessage() {
  print("Choose 1 to Add student");
  print("Choose 2 to Remove student");
  print("Choose 3 to Show student");
  print("Choose 4 to Find student");
  print("Choose 5 to Add Guest student");
  print("Choose 6 to Add Teacher");
  print("Choose 7 to Stop the system");
  stdout.write("Choose Number:");
}

void AddStudent() {
  stdout.write("Enter Student Name:");
  String fullname = stdin.readLineSync() ?? "";

  stdout.write("Enter Student Age : ");
  int studentage = int.tryParse(stdin.readLineSync() ?? '') ?? 18;

  stdout.write("Enter Student Level:");
  int studentLevel = int.tryParse(stdin.readLineSync() ?? "") ?? 1;

  stdout.write("Enter Student Department:");
  String studentdeparment = stdin.readLineSync() ?? "";

  stdout.write("Enter Student degree:");
  double studentdegree = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;
  try{
  persons.add(
    Student(
      id: Person.generateID(),
      name: fullname,
      department: studentdeparment,
      age: studentage,
      level: studentLevel,
      StudentDEG: studentdegree,
    )
  );
  print("Student Added Successfully!");
  }catch(e){
    print(e);
  }
}

void AddTeacher() {
  stdout.write("Enter Teacher Name:");
  String fullname = stdin.readLineSync() ?? "";

  stdout.write("Enter Teacher Age : ");
  int teacherage = int.tryParse(stdin.readLineSync() ?? '') ?? 25;

  stdout.write("Enter Teacher Salary:");
  int teachersalary = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

  stdout.write("Enter Teacher Department:");
  String teacherdeparment = stdin.readLineSync() ?? "";

  persons.add(
    Doctor(
      id: Person.generateID(),
      name: fullname,
      department: teacherdeparment,
      age: teacherage,
      Salary: teachersalary,
    ),
  );
  print("Teacher Added Successfully!");
}

void AddgueStstudent() {
  persons.add(Student.Guest());
  print("Guest Student Added Successfully!");
}

void RemoveStudent() {
  stdout.write("Enter ID:");
  int? id = int.tryParse(stdin.readLineSync() ?? "");
  if (id == null) {
    print("Invalid");
    return;
  }

  persons.removeWhere((person) => person.hasID(id));
  print("Remove Done");
}

void ShowStudent() {
  if (persons.isEmpty) {
    print("The List is empty");
    return;
  }

  for (Person student in persons) {
    student.printDetail();
  }
}

void findStudent() {
  if (persons.isEmpty) {
    print("The List is empty");
    return;
  }

  stdout.write("Enter ID:");
  int? id = int.tryParse(stdin.readLineSync() ?? "");
  if (id == null) {
    print("Invalid");
    return;
  }
  for (Person student in persons) {
    if (student.hasID(id)) {
      student.printDetail();
      return;
    }
  }
  print("Student Is not Found");
}