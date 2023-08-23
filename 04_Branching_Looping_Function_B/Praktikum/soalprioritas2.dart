import 'dart:core';
void printPiramid(int rows) {
  for (int i = 1; i <= rows; i++) {
    print(" " * (rows - i) + "* " * i);
  }
}

// JamPasir
void printJamPasir(int row) {
  for (int i = 1; i <= row; i++) {
    print(" " * (i - 1) + "* " * (row - i + 1));
  }
  for (int i = row - 1; i >= 1; i--) {
    print(" " * (i - 1) + "* " * (row - i + 1));
  }
}

void printFaktorial(int n) {
  BigInt faktorial = factorial(BigInt.from(n));
  print("Faktorial dari $n adalah $faktorial");
}

BigInt factorial(BigInt n) {
  if (n == BigInt.zero || n == BigInt.one) {
    return BigInt.one;
  } else {
    return n * factorial(n - BigInt.one);
  }
}

double hitungLuasLingkaran(double jariJari) {
  double pi = 3.14159;
  double luas = pi * jariJari * jariJari;
  return luas;
}

void main() {
  //soal no 1

  int rows = 8;
  printPiramid(rows);

//soal no 2
  int row = 6;
  printJamPasir(row);
//soal no 3
  //faktorial
  printFaktorial(10);
  printFaktorial(40);
  printFaktorial(50);


  //tugas function

  double jariJari = 5;
  double luas = hitungLuasLingkaran(jariJari);
  print("Luas lingkaran dengan jari-jari $jariJari adalah $luas");
}
