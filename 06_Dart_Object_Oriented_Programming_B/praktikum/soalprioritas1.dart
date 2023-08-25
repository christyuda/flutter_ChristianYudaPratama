class Hewan {
  double _berat;

  Hewan(double berat) : _berat = berat {
    if (berat <= 0) {
      throw Exception("maaf berat kurang harus melebihi dari 0");
    }
  }
  double get berat => _berat;

  set berat(double beratbaru) {
    if (beratbaru > 0) {
      _berat = berat;
    } else {
      throw Exception("Beratnya harus melebih dari 0 cuy");
    }
  }
}

void main() {
  Hewan Sapi = Hewan(600);
  print("berat si sapi adalah: ${Sapi.berat}kg");
  Hewan monyet = Hewan(200);
  print("berat si monyet itu adalah ${monyet.berat}kg");

  try {
    Sapi.berat = -100;
  } catch (e) {
    print(e);
  }
}
