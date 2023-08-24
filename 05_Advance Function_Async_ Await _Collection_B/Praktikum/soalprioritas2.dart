 import 'dart:math';
 //soal no 1 membuat sebuah list
 List<List<dynamic>> dataList = [
    ['mouse', 'keyboard'],
    ['cpu', 'monitor'],
    ['ram', 'hdd'],
    ['vga', 'hdmi'],
  ];

  Map<int, List<dynamic>> dataMap = Map.fromIterable(
    dataList,
    key: (item) => dataList.indexOf(item),
    value: (item) => item,
  );

//soal no 2 kita diminta untuk menghitung rata rata dari sekumpulan nilai 7,5,3,5,2,1
 List<int> dataangka = [7,5,3,5,2,1];
 int jumlah = dataangka.reduce((a, b) => a +b);
 double rata_rata = jumlah / dataangka.length;
 int rataratanya = rata_rata.ceil();
 

void main() {
 
print("ini jawaban dari soal no 1 : $dataMap");
 print("ini jawaban dari soal no 2 : $rataratanya");
}
