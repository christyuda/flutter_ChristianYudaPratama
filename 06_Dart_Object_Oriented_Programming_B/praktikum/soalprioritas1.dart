// class Hewan {
//   double _berat;

//   Hewan(double berat) : _berat = berat {
//     if (berat <= 0) {
//       throw Exception("maaf berat kurang harus melebihi dari 0");
//     }
//   }
//   double get berat => _berat;

//   set berat(double beratbaru) {
//     if (beratbaru > 0) {
//       _berat = berat;
//     } else {
//       throw Exception("Beratnya harus melebih dari 0 cuy");
//     }
//   }
// }

// void main() {
//   Hewan Sapi = Hewan(600);
//   print("berat si sapi adalah: ${Sapi.berat}kg");
//   Hewan monyet = Hewan(200);
//   print("berat si monyet itu adalah ${monyet.berat}kg");

//   try {
//     Sapi.berat = -100;
//   } catch (e) {
//     print(e);
//   }
// }


class Hewan {
  double berat;

  Hewan(this.berat);
}

class Mobil {
  double kapasitas;
  double muatanBeratMaksimum;
  List<Hewan> muatan = [];

  Mobil(this.kapasitas, this.muatanBeratMaksimum);

  void tambahMuatan(Hewan hewan) {
    double totalBeratMuatan = muatan.map((h) => h.berat).fold(0, (a, b) => a + b);
    if (totalBeratMuatan + hewan.berat <= muatanBeratMaksimum) {
      muatan.add(hewan);
      print("Hewan dengan berat ${hewan.berat} ditambahkan ke dalam muatan.");
    } else {
      print("Muatan penuh. Tidak dapat menambahkan hewan dengan berat ${hewan.berat}.");
    }
  }

  double totalMuatan() {
    return muatan.map((h) => h.berat).fold(0, (a, b) => a + b);
  }
}

void main() {
  Mobil mobil = Mobil(1000, 500); // Membuat objek mobil dengan kapasitas 1000 dan berat maksimum muatan 500
  
  Hewan hewan1 = Hewan(200); // Membuat hewan dengan berat 200
  Hewan hewan2 = Hewan(300); // Membuat hewan dengan berat 300
  Hewan hewan3 = Hewan(150); // Membuat hewan dengan berat 150
  
  mobil.tambahMuatan(hewan1); // Menambahkan hewan1 ke dalam muatan mobil
  mobil.tambahMuatan(hewan2); // Menambahkan hewan2 ke dalam muatan mobil
  mobil.tambahMuatan(hewan3); // Tidak dapat menambahkan hewan3 karena muatan penuh
  
  print("Total berat muatan mobil: ${mobil.totalMuatan()}"); // Menampilkan total berat muatan mobil
}
