
void printPiramid(int rows) {
  for (int i = 1; i <= rows; i++) {
    print(" " * (rows - i) + "* " * i);
  }
}

// JamPasir
void printJamPasir(int rows) {
  for (int i = 1; i <= rows; i++) {
    print(" " * (i - 1) + "* " * (rows - i + 1));
  }
  for (int i = rows - 1; i >= 1; i--) {
    print(" " * (i - 1) + "* " * (rows - i + 1));
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
  int rows = 8;
  printPiramid(rows);

  //pilih salah satu

  int rows = 6;
  printJamPasir(rows);

  //faktorial
  printFaktorial(10);
  printFaktorial(40);
  printFaktorial(50);

  //tugas function

 double jariJari = 5;
  double luas = hitungLuasLingkaran(jariJari);
  print("Luas lingkaran dengan jari-jari $jariJari adalah $luas");
}

