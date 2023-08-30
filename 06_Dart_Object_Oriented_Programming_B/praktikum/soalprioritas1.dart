
class Hewan {
  double berat;

  Hewan(this.berat);
}

class Mobil {
  double muatanBeratMaksimum;
  final List<Hewan> muatan = [];

  Mobil(this.muatanBeratMaksimum);

  void tambahMuatan(Hewan hewan) {
    final double totalBeratMuatan = muatan.map((h) => h.berat).fold(0, (a, b) => a + b);
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
  Mobil mobil = Mobil(500); 
  final Hewan hewan1 = Hewan(200);
  final Hewan hewan2 = Hewan(300); 
  final Hewan hewan3 = Hewan(150); 
  
  mobil.tambahMuatan(hewan1); 
  mobil.tambahMuatan(hewan2); 
  mobil.tambahMuatan(hewan3); 
  
  print("Total berat muatan mobil: ${mobil.totalMuatan()}"); 
}
