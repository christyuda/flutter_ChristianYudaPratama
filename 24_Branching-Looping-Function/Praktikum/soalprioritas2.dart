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
  int faktorial = factorial(n);
  print("Faktorial dari $n adalah $faktorial");
}

int factorial(int n) {
  if (n == 0 || n == 1) {
    return 1;
  } else {
    return n * factorial(n - 1);
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
