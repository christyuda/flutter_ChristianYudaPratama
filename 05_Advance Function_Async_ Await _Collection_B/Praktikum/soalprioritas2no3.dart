import 'dart:async';
import 'dart:math';
void main()async{

  int n = 5;
  int hasil = await kalkulatorfaktorial(n);
  print(hasil);
}
Future<int> kalkulatorfaktorial(int n) async{
  int factorial = 1;
  for (int i = 1; i <= n ; i++){
    factorial *=i;
    await Future.delayed(Duration(milliseconds: 100));
    
  }
  return factorial;
}