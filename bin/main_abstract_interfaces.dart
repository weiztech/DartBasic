//ABSTRACT CLASS AND INTERFACES

// abstract class (used on extends)
abstract class Planet {
  String name;
  
  Planet(this.name);

  bool has_live_being(); // abstract method

  String color() {
    return "gray";
  }

  @override
  String toString() {
    return "<Plane: $name>";
  }
}

// abstract class as interfaces (used on implements)
// interfaces is just common functionalty to unrelated class
abstract class isSave{
  
  bool has_oxygen();

}


class Mars extends Planet implements isSave{
  Mars() : super("Mars");

  @override
  bool has_live_being() {
    return true;
  }
  
  @override
  String color() {
    return "Gray Red";
  }

  @override
  bool has_oxygen() {
    return true;
  }
   
}


void main(List<String> arguments) {
  // var data = List<String>();
  List<dynamic> data = [];
  data.add("Ana");
  data.add("Campbell");

  var mars = Mars();
  data.add(mars);
  print(data);
  print(mars);
  print("${mars.has_live_being()} ${mars.color()} ${mars.has_oxygen()}");

  var animes = {
    "one-punchman": "Saitama",
    "dragonball": "Goku",
    "Fairy Tail": "Natsu"
  };

  animes.forEach((k,v){
    print("$k - $v");
  });

}

/*
Extends:

Use extends to create a subclass, and super to refer to the superclass.

Extends is the typical OOP class inheritance. If class a extends class b all properties, variables, functions implemented in class b are also available in class a. Additionally you can override functions etc.

You use extend if you want to create a more specific version of a class. For example the class car could extend the class vehicle. In Dart a class can only extend one class.


Implements:

Every class implicitly defines an interface containing all the instance members of the class and of any interfaces it implements. If you want to create a class A that supports class B’s API without inheriting B’s implementation, class A should implement the B interface.

Implements can be used if you want to create your own implementation of another class or interface. When class a implements class b. All functions defined in class b must be implemented.

When you're implementing another class, you do not inherit code form the class. You only inherit the type. In Dart you can use the implements keyword with multiple classes or interfaces.


With (Mixins):

Mixins are a way of reusing a class’s code in multiple class hierarchies.

With is used to include Mixins. A mixin is a different type of structure, which only can be used with the with keyword.

They are used in Flutter to include common code snippets. A common used Mixin is the SingleTickerProviderStateMixin.


*/