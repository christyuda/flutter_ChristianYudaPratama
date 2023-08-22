import 'dart:math';
//disini dibuatkan rumusnya

double kelilingpersegi(double sisi){
  return 4 * sisi;
}

double luasPersegi(double sisi){
  return sisi * sisi;
}
//disini dibuatkan rumusnya
double kelilingpersegipanjang(double panjang, double lebar){
  return 2 * (panjang + lebar);
}
double luaspersegipanjang(double panjang, double lebar){
  return panjang * lebar;
}

//disini dibuatkan rumus dari lingkaran
double kelilinglingkaran(double jarijari){
  return 2 * pi * jarijari;

}

double luaslingkaran(double jarijari){
  return pi * jarijari * jarijari; 
}


void main(){
  double sisiperseginya = 5;
  double panjangPersegiPanjang = 7;
  double lebarPersegiPanjang = 10;
  double jarijarilingkaran = 7;

  //disini itu persegi

  double kelilingnyaP = kelilingpersegi(sisiperseginya);
  double luasnyaP = luasPersegi(sisiperseginya);


// ini persegi panjang
  double kelilingPP = kelilingpersegipanjang(panjangPersegiPanjang,lebarPersegiPanjang);
  double luasPP = luaspersegipanjang(panjangPersegiPanjang,lebarPersegiPanjang);

  //lingkaran disini
  double kelilingL = kelilinglingkaran(jarijarilingkaran);
  double luasL = luaslingkaran(jarijarilingkaran);


  print("Keliling dari Persegi: $kelilingnyaP");
  print("Luas dari Persegi: $luasnyaP");
  

  print("Keliling dari Persegi Panjang: $kelilingPP");
  print("Luas dari Persegi Panjang: $luasPP");

  print("Keliling dari lingkaran :$kelilingL");
  print("Luas dari lingkaran :$luasL");
  

}