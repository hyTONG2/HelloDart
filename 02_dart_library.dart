import 'dart:math';

//控制台打印 https://dart.cn/guides/libraries/library-tour#printing-to-the-console
void Printing_to_the_console() {
  const object_1 = ['hi', 'hello', 'how are you'];
  String tea = 'Tieguanyin';
  print(object_1);
  print('I drink $tea.');
}

void Console_printing() {
  print('\n');
  print('*' * 40);
  print('Printing to the console');
  print('*' * 40);
  Printing_to_the_console();
}

//数字 https://dart.cn/guides/libraries/library-tour#numbers
void Numbers() {
  print('\n');
  print('*' * 40);
  print('Numbers');
  print('*' * 40);
  //使用 int 和 double 的 parse() 方法将字符串转换为整型或双浮点型对象：
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);

  //使用num的parse()方法，该方法可能会创建一个整型，否则为浮点型对象
  assert(num.parse('42') is int);
  assert(num.parse('0x42') is int);
  assert(num.parse('0.50') is double);

  //通过添加 radix 参数，指定整数的进制基数
  assert(int.parse('42', radix: 16) == 66);

  //使用 toString() 方法将整型或双精度浮点类型转换为字符串类型
  assert(42.toString() == '42');
  assert(123.456.toString() == '123.456');

  //toStringAsFixed(). 指定小数点右边的位数
  assert(123.456.toStringAsFixed(2) == '123.46');

  //使用 toStringAsPrecision(): 指定字符串中的有效数字的位数
  assert(123.456.toStringAsPrecision(2) == '1.2e+2');
  assert(double.parse('1.2e+2') == 120.0);
  print('end');
}

//字符和正则表达式 https://dart.cn/guides/libraries/library-tour#strings-and-regular-expressions
void Strings_and_regular_expressions() {
  print('\n');
  print('*' * 40);
  print('Strings_and_regular_expressions');
  print('*' * 40);
  //在字符串中搜索
  assert('Never odd or even'.contains('odd'));
  assert('Never odd or even'.startsWith('Never'));
  assert('Never odd or even'.endsWith('even'));
  assert('Never odd or even'.indexOf('odd') == 6);
  //从字符串中提取数据
  assert('Never odd or even'.substring(6,9)=='odd');

  var parts='progressive web apps'.split(' ');
  assert(parts.length==3);
  assert(parts[0]=='progressive');

  assert('Never odd or even'[0]=='N');

  for(final char in 'hello'.split('')){
    print(char);
  }
  var codeUnitList='Never odd or even'.codeUnits.toList();
  assert(codeUnitList[0]==78);
  //首字母大小写转换
  assert('web apps'.toUpperCase()=='WEB APPS');
  assert('WEB APPS'.toLowerCase()=='web apps');

  //Trimming和空字符串
  //使用 trim() 移除首尾空格
  //使用 isEmpty 检查一个字符串是否为空（长度为 0）
  assert('  hello  '.trim()=='hello');
  assert(''.isEmpty);
  assert('  '.isNotEmpty);

  //替换部分字符串
  var greetingTemplate='Hello,NAME!';
  var greeting=greetingTemplate.replaceAll(RegExp('NAME'),'Bob');
  //greetingTemplate didn't change.
  assert(greeting!=greetingTemplate);

  //构建一个字符串
  var sb=StringBuffer();
  //在调用 toString() 之前， StringBuffer 不会生成新字符串对象
  sb
    ..write('Use a StringBuffer for')
      //writeAll() 的第二个参数为可选参数，用来指定分隔符，本例中使用空格作为分隔符
    ..writeAll(['efficient','string','creation'],' ')
    ..write('.');

  var fullString=sb.toString();
  assert(fullString=='Use a StringBuffer for efficient string creation.');
}

void main(List<String> args) {
  //控制台打印
  Console_printing();
  //数字
  Numbers();
  //字符和正则表达式
  Strings_and_regular_expressions();
}
