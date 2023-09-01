class BangunRuang {
  double panjang;
  double tinggi;
  double lebar;

  BangunRuang(this.panjang, this.tinggi, this.lebar);

  double volume() {
    return panjang * tinggi * lebar;
  }
}

class Kubus extends BangunRuang {
  double sisi;

  Kubus(this.sisi) : super(sisi, sisi, sisi);

  @override
  double volume() {
    return sisi * sisi * sisi; // Rumus volume kubus
  }
}

class Balok extends BangunRuang {
  Balok(double panjang, double tinggi, double lebar)
      : super(panjang, tinggi, lebar);

  @override
  double volume() {
    return panjang * tinggi * lebar; // Rumus volume balok
  }
}

void main() {
  BangunRuang bangun = Balok(4.0, 3.0, 2.0); // Objek Balok
  double volumeBangun = bangun.volume();
  print('Volume Bangun Ruang: $volumeBangun');

  Kubus kubus = Kubus(5.0); // Objek Kubus
  double volumeKubus = kubus.volume();
  print('Volume Kubus: $volumeKubus');

  Balok balok = Balok(4.0, 3.0, 2.0); // Objek Balok
  double volumeBalok = balok.volume();
  print('Volume Balok: $volumeBalok');
}
