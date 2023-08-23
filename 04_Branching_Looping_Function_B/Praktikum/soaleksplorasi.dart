import 'dart:math';

bool bilprim(int n) {
  if (n <= 1) {
    return false;
  }
  for (int i = 2; i <= sqrt(n); i++) {
    if (n % i == 0) {
      return false;
    }
  }
  return true;
}

void perkaliantabel(int n) {
  StringBuffer buffer = StringBuffer();
  for (int i = 1; i <= n; i++) {
    for (int j = 1; j <= n; j++) {
      int result = i * j;
      if (result < 10) {
        // Untuk hasil satu digit, tambahkan spasi tambahan untuk penampilan yang seragam
        buffer.write(" $result\t");
      } else {
        buffer.write("$result\t");
      }
    }
  }
  print(buffer.toString());
}

void main() {
  //yang dibawah ini soal no 1
  int inputNumber = 23;
  if (bilprim(inputNumber)) {
    print("bilangan prima");
  } else {
    print("bukan bilangan prima");
  }
  //yang dibawah ini soal no 2
  int inputNumbers = 9;
  perkaliantabel(inputNumbers);
}
