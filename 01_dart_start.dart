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

//函数 https://dart.cn/samples#functions
void functions(){
  int fibonacci(int n){
    if (n == 0 || n == 1) return n;
    return fibonacci(n-1)+fibonacci(n-2);
  }
  var result=fibonacci(20);
  print('The result is $result');

  //（胖箭头）简写语法用于仅包含一条语句的函数
  var flybyObjects=['Jupiter','Saturn','Uranus','Neptune'];
  flybyObjects.where((name) => name.contains('turn')).forEach(print);
}
void main(List<String> args){
  variables();  //变量
  flow_control(); //流程控制语句
  functions(); //函数
 
}