import 'dart:io';

List<Map<String,dynamic>> students = [];
int counter = 1;

void showMessage() {
  
  print("1- Add Student");
  print("2- Remove Student");
  print("3- Show Students");
  print("4- Find Student");
  print("5- Exit");
  stdout.write("Choose Number: ");
}

void addStudent () {
  stdout.write("Enter Student's Name: ");
  String name = stdin.readLineSync() ??"";
  
  stdout.write("Enter Student's Level: ");
  int level = int.tryParse(stdin.readLineSync() ?? "") ?? 1;

  stdout.write("Enter Student's Department: ");
  String department = stdin.readLineSync() ?? "";

  stdout.write("Enter Student's GPA: ");
  double gpa = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;

  students.add({
    'id': counter++,
    'name': name,
    'department': department,
    'level': level,
    'gpa': gpa
  });

  print("Student Was Added Successfully!.");
}

void removeStudent() {
  stdout.write("Enter Student's ID: ");
  int? id = int.tryParse(stdin.readLineSync() ?? "");

  if (id==null) {
    print("Invalid Input!!.");
    return;
  } 

  if (students.any((student) => student['id'] == id)) {
      students.removeWhere((student) => student['id'] == id);
      print("Student Was Removed Successfully!.");
  } 
  else {
      print("Student Was Not Found!.");
  }

}

void showStudent() {
  if(students.isEmpty) {
    print("Student's List is Empty!.");
    return;
  }

  for (var student in students) {
    print("ID: ${student['id']} \nName: ${student['name']}. \nDepartment: ${student['department']}. \nLevel: ${student['level']}. \nGPA: ${student['gpa']}.");
  }
}

void findStudent() {
  stdout.write("Enter Student's ID: ");
  int? id = int.tryParse(stdin.readLineSync() ?? "");

  if (id==null) {
    print("Invalid Input!!.");
    return;
  } 

  for (var student in students) {
    if (student['id'] == id) {
      print("ID: ${student['id']} \nName: ${student['name']}. \nDepartment: ${student['department']}. \nLevel: ${student['level']}. \nGPA: ${student['gpa']}.");
      return;
    }
  }

  print("Student Was Not Found!.");
}

void main() {
  String appName = "Students Managment System";
  print(appName);

  bool work = true;
  while (work) {

    showMessage();

    String number = stdin.readLineSync() ?? "";

    switch(number) {
      case "1":
        addStudent();
        break;
      case "2":
        removeStudent();
        break;
      case "3":
        showStudent();
        break;
      case "4":
        findStudent();
        break;
      case "5":
        work = false;
        break;
      default:
        print("Invalid Input!.");
    }
  }
}