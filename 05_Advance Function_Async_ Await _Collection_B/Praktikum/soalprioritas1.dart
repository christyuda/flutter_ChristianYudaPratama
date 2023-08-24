Future<List<int>> listbanyak(List<int> data, int multi) async {
  List<int> hasil = [];

  for (int element in data) {
    int valuemulti = element * multi;
    hasil.add(valuemulti);
    await Future.delayed(Duration(milliseconds: 100));
  }

  return hasil;
}

void main() async {
  List<int> inputListnya = [1, 2, 3, 4, 5];
  int multi = 2;
  List<int> daftarlist = await listbanyak(inputListnya, multi);
  print("Input Listnya : $inputListnya");
  print("multi list: $daftarlist");
}
