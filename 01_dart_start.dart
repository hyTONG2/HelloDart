//导入（Import）
import 'dart:math';
import 'dart:async';
import 'dart:io';
//import 'package:test01/test01.dart';
//import 'path/to/00_helloworld.dart';

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

//注释 ///文档注释 /* */

//类（class） https://dart.cn/samples#classes
class Spacecraft {
  String name;
  DateTime? launchDate;

  int? get launchYear => launchDate?.year;

  Spacecraft(this.name, this.launchDate) {
    // Initialization code goes here.
  }

  Spacecraft.unlaunched(String name) : this(name, null);

  // Method.
  void describe() {
    print('Spacecraft: $name');
   
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

//拓展类（继承）https://dart.cn/samples#inheritance
class Orbiter extends Spacecraft{
  double altitude;
  Orbiter(String name,DateTime launchDate,this.altitude)
      :super(name,launchDate);
}

//Mixins (在多个类层次结构中重用代码的方法) https://dart.cn/samples#mixins
mixin Piloted{
  int astronauts=1;
  void describeCrew(){
    print('Number of astronaunts: $astronauts');
  }
}
//使用 Mixin 的方式继承这个类就可将该类中的功能添加给其它类
//PilotedCraft 类中就包含了 astronauts 字段以及 describeCrew() 方法
class PilotedCraft extends Spacecraft with Piloted{
  PilotedCraft(String name,DateTime launchDate)
      :super(name,launchDate);
}
//抽象和接口类 https://dart.cn/samples#interfaces-and-abstract-classes
class MockSpaceship implements Spacecraft{
  @override
  DateTime? launchDate;
  @override
  String name;
  MockSpaceship(this.name,this.launchDate);
  @override
  void describe(){
    print('Mock Spacecraft: $name');
  }
  @override
  int? get launchYear => launchDate?.year;
}

//异步 https://dart.cn/samples#async
Future<void> the_async() async {
  const oneSecond = Duration(seconds: 1);

  Future<void> printWithDelay1(String message) async {
    await Future.delayed(oneSecond);
    print(message);
  }

  printWithDelay1('过了1秒钟. 1');
  print('done 1.');

  Future<void> printWithDelay2(String message) {
    return Future.delayed(oneSecond).then((_) {
      print(message);
    });
  }

  printWithDelay2('过了1秒钟. 2');
  print('done 2.');

  Future<void> createDescriptions(Iterable<String> objects) async {
    for (final object in objects) {
      try {
        var file = File('$object.txt');
        if (await file.exists()) {
          var modified = await file.lastModified();
          print(
              'File for $object already exists. It was modified on $modified.');
          continue;
        }
        await file.create();
        await file.writeAsString('Start Describing $object in this file.');
        print('File for $object created.');
      } on IOException catch (e) {
        print('Cannot create description for $object: $e');
      }
    }
  }

  var theobjects = ['obj1', 'obj2', 'obj3'];
  createDescriptions(theobjects);

  await Future.delayed(Duration(seconds: 5));
}

//异常 https://dart.cn/samples#exceptions
 Future<void> show_Descriptions(flybyObjects) async {
   try{
     for(final object in flybyObjects){
       var description=await File('$object.txt').readAsString();
       print(description);
     }
   }on IOException catch(ex){
     print('Could not describe object:$ex');
   }finally{
     flybyObjects.clear();
   }
 }
 void exceptions() {
   var flybyObjects = ['flybo1', 'flyob2', 'flyob3', 'fltob4'];
   show_Descriptions(flybyObjects);
}
Future<void> main(List<String> args) async{
  variables();  //变量
  flow_control(); //流程控制语句
  functions(); //函数

  //类
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();
  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();

  //拓展类
  var voyager4 = Orbiter('Voyager IV',DateTime(1960,12,12),2800.0);
  voyager4.describe();

  //Mixins
  var pilotedcra=PilotedCraft('PilotedCraft IIV',DateTime(1967,2,12));
  pilotedcra.describe();
  pilotedcra.describeCrew();
  //抽象和接口类
  var Mock=MockSpaceship('测试飞行器',null);
  Mock.describe();
  //异步
  await the_async();
  //异常
  exceptions();
}