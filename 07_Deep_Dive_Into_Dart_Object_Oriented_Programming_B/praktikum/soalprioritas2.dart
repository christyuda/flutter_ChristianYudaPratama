class Matematika {
  double hasil() {
    // Method ini akan diimplementasikan di class turunan
    return 0.0;
  }
}

class KelipatanPersekutuanTerkecil implements Matematika {
  int x;
  int y;

  KelipatanPersekutuanTerkecil(this.x, this.y);

  @override
  double hasil() {
    int maks = x > y ? x : y;
    while (true) {
      if (maks % x == 0 && maks % y == 0) {
        return maks.toDouble();
      }
      maks++;
    }
  }
}

class FaktorPersekutuanTerbesar implements Matematika {
  int x;
  int y;

  FaktorPersekutuanTerbesar(this.x, this.y);

  @override
  double hasil() {
    while (y != 0) {
      final t = y;
      y = x % y;
      x = t;
    }
    return x.toDouble();
  }
}

void main() {
  Matematika operasi1 = KelipatanPersekutuanTerkecil(12, 18);
  Matematika operasi2 = FaktorPersekutuanTerbesar(24, 36);

  print('Kelipatan Persekutuan Terkecil: ${operasi1.hasil()}');
  print('Faktor Persekutuan Terbesar: ${operasi2.hasil()}');
}
