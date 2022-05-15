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
  assert('Never odd or even'.substring(6, 9) == 'odd');

  var parts = 'progressive web apps'.split(' ');
  assert(parts.length == 3);
  assert(parts[0] == 'progressive');

  assert('Never odd or even'[0] == 'N');

  for (final char in 'hello'.split('')) {
    print(char);
  }
  var codeUnitList = 'Never odd or even'.codeUnits.toList();
  assert(codeUnitList[0] == 78);
  //首字母大小写转换
  assert('web apps'.toUpperCase() == 'WEB APPS');
  assert('WEB APPS'.toLowerCase() == 'web apps');

  //Trimming和空字符串
  //使用 trim() 移除首尾空格
  //使用 isEmpty 检查一个字符串是否为空（长度为 0）
  assert('  hello  '.trim() == 'hello');
  assert(''.isEmpty);
  assert('  '.isNotEmpty);

  //替换部分字符串
  var greetingTemplate = 'Hello,NAME!';
  var greeting = greetingTemplate.replaceAll(RegExp('NAME'), 'Bob');
  //greetingTemplate didn't change.
  assert(greeting != greetingTemplate);

  //构建一个字符串
  var sb = StringBuffer();
  //在调用 toString() 之前， StringBuffer 不会生成新字符串对象
  sb
    ..write('Use a StringBuffer for ')
    //writeAll() 的第二个参数为可选参数，用来指定分隔符，本例中使用空格作为分隔符
    ..writeAll(['efficient', 'string', 'creation'], ' ')
    ..write('.');

  var fullString = sb.toString();
  assert(fullString == 'Use a StringBuffer for efficient string creation.');

  //正则表达式
  //RegExp 类提供与 JavaScript 正则表达式相同的功能
  //使用正则表达式可以对字符串进行高效搜索和模式匹配
  var numbers = RegExp(r'\d+');

  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';

  assert(!allCharacters.contains(numbers));
  assert(someDigits.contains(numbers));

  var exedOut = someDigits.replaceAll(numbers, 'XX');
  assert(exedOut == 'llamas live XX to XX years');

  // Check whether the reg exp has a match in a string.
  assert(numbers.hasMatch(someDigits));
  for (final match in numbers.allMatches(someDigits)) {
    print(match.group(0)); //15,20
  }
}

//集合 https://dart.cn/guides/libraries/library-tour#collections
//Dart 附带了核心集合 API ，其中包括 list、set 和 map 类

//Lists
void Lists() {
  print('\n');
  print('*' * 40);
  print('Lists');
  print('*' * 40);
  // Create an empty list of strings.
  var grains = <String>[];
  assert(grains.isEmpty);
  // Create a list using a list literal.
  var fruits = ['apples', 'oranges'];
  // Add to a list.
  fruits.add('kiwis');
  //Add multiple items to a list.
  fruits.addAll(['grapes', 'bananas']);

  assert(fruits.length == 5);
  // Remove a single item.
  var appleIndex = fruits.indexOf('apples');
  //删除fruits的第 appleIndex+1 个元素——>'apples'
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);

  fruits.clear();
  assert(fruits.isEmpty);

  // You can also create a List using one of the constructors.
  var vegetables = List.filled(99, 'broccoli');
  assert(vegetables.every((v) => v == 'broccoli'));

  //使用 indexOf() 方法查找一个对象在 list 中的下标值
  fruits = ['apples', 'oranges'];
  assert(fruits[0] == 'apples');
  assert(fruits.indexOf('apples') == 0);

  //使用 sort() 方法排序一个 list
  fruits = ['bananas', 'apples', 'oranges'];
  fruits.sort((a, b) => a.compareTo(b));
  assert(fruits[0] == 'apples');
  print('ListsTest');
  print(fruits);

  //列表是参数化类型（泛型），因此可以指定 list 应该包含的元素类型：
  var fruits1 = <String>[];
  fruits1.add('apples');
  var fruit = fruits1[0];
  assert(fruit is String);
}

//Sets
void Sets() {
  print('\n');
  print('*' * 40);
  print('Sets');
  print('*' * 40);
  //Create an empty set of strings.
  var ingredients = <String>{};
  // Add new items to it.
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.length == 3);
  //Adding a duplicate(重复) item has no effect
  ingredients.add('gold');
  assert(ingredients.length == 3);
  // Remove an item from a set.
  ingredients.remove('gold');
  assert(ingredients.length == 2);
  // You can also create sets using one of the constructors(构造函数)
  var atomicNumbers = Set.from([79, 22, 54]);

  //使用 contains() 和 containsAll() 来检查一个或多个元素是否在 set 中
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.contains('titanium'));
  assert(ingredients.containsAll(['titanium', 'xenon']));

  //交集是另外两个 set 中的公共元素组成的 set
  // Create the intersection of two sets.
  var nobleGases = Set.from(['xenon', 'argon']);
  var intersection = ingredients.intersection(nobleGases);
  // intersection () 方法返回包含两个或更多集合之间相似性的集合。
  // 含义：返回的集合仅包含两个集合中都存在的项目
  // 或者如果使用两个以上的集合进行比较，则在所有集合中都存在。
  assert(intersection.length == 1);
  assert(intersection.contains('xenon'));
  print('SetsTest');
  print(intersection);
}

//集合——Maps
void Maps() {
  print('\n');
  print('*' * 40);
  print('Maps');
  print('*' * 40);
  //声明 map 可以使用简洁的字面量语法，也可以使用传统构造函数
  //Maps often use strings as keys.
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };
  // Maps can be built from a constructor.
  var searchTerms = Map();
  // Maps are parameterized types; you can specify what
  // types the key and value should be.
  var nobleGases = Map<int, String>();

  //通过大括号语法可以为 map 添加，获取，设置元素
  //使用 remove() 方法从 map 中移除键值对
  nobleGases = {54: 'xenon'};
  // Retrieve a value with a key.
  assert(nobleGases[54] == 'xenon');
  // Check whether a map contains a key.
  assert(nobleGases.containsKey(54));
  // Remove a key and its value.
  nobleGases.remove(54);
  assert(!nobleGases.containsKey(54));

  //可以从一个 map 中检索出所有的 key 或所有的 value
  // Get all the keys as an unordered collection
  // (an Iterable).(可迭代对象)
  var keys = hawaiianBeaches.keys;
  assert(keys.length == 3);
  assert(Set.from(keys).contains('Oahu'));
  print('keys:');
  print(keys);
  // Get all the values as an unordered collection
  // (an Iterable of Lists).
  var values = hawaiianBeaches.values;
  assert(values.length == 3);
  assert(values.any((v) => v.contains('Waikiki')));
  print('values:');
  print(values);
  //使用 containsKey() 方法检查一个 map 中是否包含某个key
  //因为 map 中的 value 可能会是 null ，所有通过 key 获取 value
  //并通过判断 value 是否为 null 来判断 key 是否存在是不可靠的
  assert(hawaiianBeaches.containsKey('Oahu'));
  assert(!hawaiianBeaches.containsKey('Florida'));
  //如果当且仅当该 key 不存在于 map 中，
  //且要为这个 key 赋值，可使用 putIfAbsent() 方法
  //该方法需要一个方法返回这个 value
  var teamAssignments = <String, String>{};
  String pickToughestKid() {
    return "pickToughestKid";
  }

  teamAssignments.putIfAbsent('Catcher', () => pickToughestKid());
  assert(teamAssignments['Catcher'] != null);
  print('MapsTest');
  print(teamAssignments);
}

//公共集合方法
void Commom_collection_methods() {
  //List, Set, 和 Map 共享许多集合中的常用功能
  //其中一些常见功能由 Iterable 类定义，这些函数由 List 和 Set 实现
  print('\n');
  print('*' * 40);
  print('Commom_collection_methods');
  print('*' * 40);

  //使用 isEmpty 和 isNotEmpty 方法可以检查 list， set 或 map 对象中是否包含元素
  var coffees = <String>[];
  var teas = ['green', 'black', 'chamomile', 'earl grey'];
  assert(coffees.isEmpty);
  assert(teas.isNotEmpty);
  //使用 forEach() 可以让 list， set 或 map 对象中的每个元素都使用一个方法
  teas = ['green', 'black', 'chamomile', 'earl grey'];
  teas.forEach((tea) => print('I drink $tea'));
//当在 map 对象上调用 `forEach() 方法时，函数必须带两个参数（key 和 value）
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };
  hawaiianBeaches.forEach((k, v) {
    print('I want to visit $k and swim at $v');
    // I want to visit Oahu and swim at
    // [Waikiki, Kailua, Waimanalo], etc.
  });
//Iterable 提供 map() 方法，这个方法将所有结果返回到一个对象中
  var loudTeas = teas.map((tea) => tea.toUpperCase());
  loudTeas.forEach(print);
//map() 方法返回的对象是一个 懒求值（lazily evaluated）对象：
//只有当访问对象里面的元素时，函数才会被调用。

//使用 map().toList() 或 map().toSet() ，可以强制在每个项目上立即调用函数
  loudTeas = teas.map((tea) => tea.toUpperCase()).toList();

//使用 Iterable 的 where() 方法可以获取所有匹配条件的元素
//使用 Iterable 的 any() 和 every() 方法可以检查部分或者所有元素是否匹配某个条件
// Chamomile is not caffeinated.
  bool isDecaffeinated(String teaName) => teaName == 'chamomile';
// Use where() to find only the items that return true
// from the provided function.
  var decaffeinatedTeas = teas.where((tea) => isDecaffeinated(tea));
// or teas.where(isDecaffeinated)

// Use any() to check whether at least one item in the
// collection satisfies a condition.
  assert(teas.any(isDecaffeinated));

// Use every() to check whether all the items in a
// collection satisfy a condition.
  assert(!teas.every(isDecaffeinated));
}

void main(List<String> args) {
  //控制台打印
  Console_printing();
  //数字
  Numbers();
  //字符和正则表达式
  Strings_and_regular_expressions();
  //集合——Lists
  Lists();
  //集合——Sets
  Sets();
  //集合——Maps
  Maps();
  //集合——公共集合方法
  Commom_collection_methods();
}
