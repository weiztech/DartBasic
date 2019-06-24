// futures

class Person {
  String name;

  Person(this.name);
}

Future<Person> createPerson(String name) async {
  return Person(name);
}

Future<String> delayHello() async {
  await Future.delayed(Duration(seconds: 2), () => print("Delay Hello"));
  return "Hello World";
}

Future<String> helloWorld() async {
  return "Hello World";
}

void main() {
  print('MAIN $helloWorld()');
  helloWorld().
    then((val) => print(val));

  delayHello()
    .then((val) => print(val));

  createPerson("Asada")
    .then((Person person) => print("Person Name is ${person.name}"));

}
