void main() {
  print(divideNumbers(10 , 2));
  print(divideNumbers(10 , 0));
  print(divideNumbers(null , 2));
}

String divideNumbers(int? a, int? b) {
  a ??=0;
  b ??=0;

  try {
    if (b==0){
      throw Exception("can not devide by 0");
    }
    return 'result : ${a/b}';
  }
  catch (e) {
    return 'error : $e';
  }
}