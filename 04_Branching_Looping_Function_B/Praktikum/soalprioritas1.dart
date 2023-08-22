String Ceknilai(int nilai){
    if (nilai>70){
        return "Nilai A";
    }
    else if (nilai> 40){
        return"Nilai B";
    }else if (nilai> 0){
        return"Nilai C";
    }else{
        return " ";
    }
}

  
  void main(){
    int nilai = 60;
    String hasil = Ceknilai(nilai);
    print("nilaimu adalah : $hasil");
  }