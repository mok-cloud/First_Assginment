
void main () {

  List<Map<String,dynamic>> stu = [
    {"name" : "Mokhter" , "age" : 22 , "grade" : 85},
    {"name" : "Sultan" , "age" : 25 , "grade" : 55},
    {"name" : "Ali" , "age" : 21 , "grade" : 60}
    ];

  void addstu(List<Map<String,dynamic>> list,{required name,required age,required grade}){
    list.add({'name' : name , 'age' : age , 'grade' : grade});
  }

  addstu(stu, name: 'Ahmed', age: 27, grade: 61);

  for (var student in stu) {
    if (student['grade']>60) {
      print("name : ${student['name']} , age : ${student['age']}, grade : ${student['grade']}");
    }
  }
}