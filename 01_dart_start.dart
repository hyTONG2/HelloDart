//变量 https://dart.cn/samples#variables
void variables(){
  var name='Voyager I';
  var year=1997;
  var antennaDiameter=3.7;
  var flybyObjects=['Jupiter','Saturn','Uranus','Neptune'];
  var image={
    'tags':['saturn'],
    'url':'//path/to/saturn.jpg'
  };
  print('name is $name,year is $year,antennaDiameter is $antennaDiameter,flybyObjects is $flybyObjects,image is $image');
}

//流程控制语句 https://dart.cn/samples#control-flow-statements
void flow_control(){
   var year=1997;
   if(year>=2001){
     print('21st century');
   }else if(year>=1901){
     print('20th century');
   }
   
   const flybyObjects=['Obj1','Obj2','Obj3'];
   for(final object in flybyObjects){
     print(object);
   }

   for(int month=1;month<=12;month++){
     print(month);
   }

   while(year<2016){
     year+=1;
   }
   print('year is $year');
}
void main(List<String> args){
  //变量
  variables();
  flow_control();
}