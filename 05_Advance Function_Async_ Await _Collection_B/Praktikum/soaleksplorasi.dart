
//no 1 duplikat dari list 
List<String> inputList =['amuse', 'tommy kaira','spoon','HKS','litchfield','amuse','HKS'];
List<String> listUnik = inputList.toSet().toList();

//no 2 frekuensi kemunculan data dalam list

List<String> listinput = ['js', 'js', 'js','golang', 'python','js','js','golang','rust']; 

void main(){
  Map<String, int> frekuensiMap = {};
for(String item in listinput){
  if(frekuensiMap.containsKey(item)){
    frekuensiMap[item] = (frekuensiMap[item]?? 0)+ 1;
  }else{frekuensiMap[item]= 1;
}

}
 frekuensiMap.forEach((key, value) {
    print('$key: $value');
  });
  print(listUnik);
}