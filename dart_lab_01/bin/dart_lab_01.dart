import 'dart:io';
void main(List<String> arguments) {
  // print("Enter first number: " );
  // int num1 = int.parse(stdin.readLineSync()!);
  // print("Enter second number: " );
  // int num2= int.parse(stdin.readLineSync()!);
  // int sum = num1 + num2;
  // int sub = num1 - num2;
  // int mul = num1 * num2;
  // double div = num1 / num2;
  
  // print("Sum of two numbers is: ${sum}");
  // print("Subtraction of two numbers is: ${sub}");
  // print("Multiplication of two numbers is: ${mul}");
  // print("Division of two numbers is: ${div}");
   
  //  print("Enter a number:");
  //     int number =int.parse(stdin.readLineSync()!);
  //     if(number%2==0){
  //       print("The number is even");
  //     }else{
  //       print("The number is odd");
  //     }

  // print("Enter first number:");
  // int num1 = int.parse(stdin.readLineSync()!);
  // print("Enter second number:");
  // int num2 = int.parse(stdin.readLineSync()!);
  // print("Enter third number:");
  // int num3 = int.parse(stdin.readLineSync()!);
  
  // if (num1 > num2 && num1 > num3) {
  //   print("The largest number is: ${num1}");
  // } else if (num2 > num1 && num2 > num3) {
  //   print("The largest number is: ${num2}");
  // } else {
  //   print("The largest number is: ${num3}");
  // }
  // print("Enter first number:");
  // int num1=int.parse(stdin.readLineSync()!);
  // print("Enter second number:");
  // int num2=int.parse(stdin.readLineSync()!);

  // num1=num1+num2;
  // num2=num1-num2;
  // num1=num1-num2;

  // print("After swapping, first number is: ${num1}");
  // print("After swapping, second number is: ${num2}");
  
  
  // print("Enter Principal Amount (P):");
  // double principal = double.parse(stdin.readLineSync()!);

  // print("Enter Rate of Interest (R):");
  // double rate = double.parse(stdin.readLineSync()!);

  // print("Enter Time Period in years (T):");
  // double time = double.parse(stdin.readLineSync()!);

  // double simpleInterest = (principal * rate * time) / 100;
  //   print("Simple Interest = \$${simpleInterest.toStringAsFixed(2)}");

  // print("Enter a string:");
  // String str=stdin.readLineSync()!;

  // String reversedStr=str.split('').reversed.join();
  // print(reversedStr);

  // print("Enter a year:");
  // int year=int.parse(stdin.readLineSync()!);
  //  if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
  //   print("$year is a Leap Year.");
  // } else {
  //   print("$year is not a Leap Year.");
  // }
  // print("Enter a number:");
  // int num=int.parse(stdin.readLineSync()!);
  // for(int i=1;i<=10;i++){
  //   print("${num} * ${i} = ${num*i}");
  // }

  
  print("Enter an integer:");
  int number=int.parse(stdin.readLineSync()!);
  int digitCount=number.abs().toString().length;
  print("Number of digits in $number is: $digitCount");
}