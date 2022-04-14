//控制台打印 https://dart.cn/guides/libraries/library-tour#printing-to-the-console
void Printing_to_the_console(){
  const object_1=['hi','hello','how are you'];
  String tea='Tieguanyin';
  print(object_1);
  print('I drink $tea.');
  assert(int.parse('42')==42);
}
void Console_printing(){
  print('\n');
  print('*'*40);
  print('Printing to the console');
  print('*'*40);
  Printing_to_the_console();
}
void main(List<String> args){
  //控制台打印
  Console_printing();
}