import 'dart:math';

String katapertama = "Mari Kita Belajar";
String katakedua = " ";
String kataketiga = "Flutter";

double volumetabung(double jarijari, double tinggi){
  return pi * jarijari * tinggi;
}



String gabungkata123 =  katapertama + katakedua + kataketiga;

void main(){
  print("Soal Pertama : $gabungkata123");

  double jarijari = 5;
  double tinggi = 10;
  double VolumeT = volumetabung(jarijari,tinggi);

  print("Soal Kedua : ini adalah Bolume Tabung : $VolumeT");
}