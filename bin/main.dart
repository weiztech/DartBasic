// Generic class

void main() {
  var space_earth = Space<Earth, Mars>.return_earth(Earth());
  print(space_earth);

  var space_mars = Space<Earth, Mars>.return_mars(Mars());
  print(space_mars);
}

class Mars {}

class Earth {}

class Space<T, S> {

  Space.create();

  factory Space.return_earth(T planet){
    return Space.create();
  }

  factory Space.return_mars(S planet){
    return Space.create();
  }
}

/*
class Counter<T extends num> {
   List<T> _items = new List<T>();
   void addAll(Iterable<T> iterable) => _items.add(iterable);
   void add(T value) => _items.add(value);
   
   T elementAt(int index) => _items.elementAt(index);
  
   void total() {  
      num value = 0;
      _items.forEach((item){
            values = values + item;
      });
      print(value);
    }
}*/

/*
main() {
    List values = [1, 2, 4, 5];
    print(subtract(15, values));
}
T subtract<T extends num>(T value, List<T> items){
    T x = items;
    items.forEach((values) {
         x = x - value;
    });
    return x;
}*/


/*
void main(){  
   add<int>(1, 2); // prints 3
   add<double>(1.0, 2.0); // prints 3.0
   add<String>("Sharad", "Ghimire"); // prints SharadGhimire
   addNumbers(1, 2); // Gives error but still work??
 }
void add<T>(T a, T b) {   // T is shorthand for type
    print(a + b); // But, for String, the operator + isn't defined for the class 'Object'
}
void addNumbers<T extends num>(T a, T b){ // num includes int and doubles so it does not work for String
    print(a +b);
}*/