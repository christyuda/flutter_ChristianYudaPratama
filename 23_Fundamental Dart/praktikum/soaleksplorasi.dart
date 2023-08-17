void main(){

  //mengecek kata palindrom atau bukan niihh
  String kata = "kasur rusak";
  String kata2 = "mobil balap";
  
  kata =  kata.replaceAll(" ", "").toLowerCase();
  kata2 =  kata2.replaceAll(" ", "").toLowerCase();
  String katabalik = kata.split('').reversed.join();
  String katabalik2 = kata2.split('').reversed.join();


  if (kata == katabalik|| kata2 == katabalik2){
    print("palindrom : $katabalik");
    print("palindrom : $katabalik2");
  }else{
    print("bukan palindrom : $katabalik");
    print("bukan palindrom: $katabalik");
  }

//pnegecekan bilangan faktorial
int bilangan = 24;
print("Faktor dari $bilangan adalah : ");

for(int i = 1;i <= bilangan; i++){
  if(bilangan % i ==0){
    if (bilangan !=i){
      print(i);
    }
    
  }
  

}


  
}