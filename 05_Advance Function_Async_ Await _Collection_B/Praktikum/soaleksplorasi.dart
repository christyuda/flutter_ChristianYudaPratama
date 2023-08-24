
//no 1 duplikat dari list 
List<String> inputList =['amuse', 'tommy kaira','spoon','HKS','litchfield','amuse','HKS'];
List<String> listUnik = removeDuplicates(inputList);

  List<String> inputlist2 = ['JS Racing', 'amuse', 'spoon', 'spoon', 'JS Racing', 'amuse'];
  List<String> listUnik2 = removeDuplicates(inputlist2);

List<String> removeDuplicates(List<String> inputList) {
  Set<String> uniqueSet = Set<String>.from(inputList);
  return uniqueSet.toList();}
//no 2 frekuensi kemunculan data dalam list

List<String> listinput = ['js', 'js', 'js','golang', 'python','js','js','golang','rust']; 

void main(){
 
  print(listUnik);
    print(listUnik2);

map();

}

void map(){
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
}