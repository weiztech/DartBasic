import 'package:my_dart/src/helper.dart';

String test = "Hi";

void main(List<String> arguments) {
  const counter = [1, 2, 3];
  print("${other("Mamia", 10)}");
  other("Mamia");
  print("Arguments: ${arguments}");
  print("${test} Max, its ${counter[1]} and length is ${counter.length}");

  if (counter.length == 3) {
    print("Yes");
  } else if (counter.length == 5) {
    print("its Great");
  } else {
    print("No data");
  }

  String playerName(String name) => name ?? 'Guest';
  print("I'am ${playerName("asda")}");

  List<String> data = []
    ..addAll(["hahah", "123", "yay"])
    ..add("last");

  print(data);

  for (var i = 0; i < data.length; i++) {
    print("For data ${data[i]}, ${data.join("+")}");
  }

  var mylist = data.map((x) {
    return x;
  });
  print("${mylist}");
  // data = data.followedBy(["Yow!", "boy"]);
  var data2 = data.expand((m) => [m, data.indexOf(m)]);
  print("data ${data.runtimeType}");
  print("${data.followedBy(["Yow!", "boy"]).runtimeType}");
  print("last ${data2.runtimeType}");

  void myFunction() {
    var insideFunction = true;
    print("myfunction $insideFunction $test");

    void nestedFunction() {
      var insideNestedFunction = true;
      insideFunction = false;
      print("nested $insideFunction $insideNestedFunction");
    }
  }
}
