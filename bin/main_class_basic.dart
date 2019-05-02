class Car {
  
  String name;
  String model;
  int year;
  
  // Sugar Constructor
  Car(this.name, this.model, this.year);
  
  // Constructor
  /*Car(String name, String model, int year){
    this.name = name;
    this.model = model;
    this.year = year;
  }*/

  // Named Constructor 1
  Car.create_bmw([int year]){
    // if not assign for arguments, `this` is optional
    name = "BMW";
    model = "X-Org";
    // if it's arguments, must assign to variable using this
    // if not use `this`, the value will be null
    this.year = year;

  }
  // Named Constructor 2

  String info() {
    return "$name $model ($year)";
  }

  String get getName{
    return name;
  }

  set setName(String new_name){
    this.name = new_name;
  }
  
  /// Defines a flag with the given name and abbreviation.
  ///
  /// @param name The name of the flag.
  /// @param abbr The abbreviation for the flag.
  /// @returns The new flag.
  /// @throws ArgumentError If there is already an option with
  /// the given name or abbreviation.
  bool is_fast() => true;

  @override
  String toString() {
    return "<$name: $model>";
  }
}

class Tesla extends Car {
  
  Tesla(String model, int year) : super("Tesla Ini cok", model, year){
    print("Heloo tesla");
  }
  
  @override
  bool is_fast([bool fast]) {
    print("override is_fast");
    return fast ?? super.is_fast();
  }

}

void main() {
  var bmw = Car.create_bmw();
  print("${bmw.info()} ${bmw.is_fast()}");
 
  var bmw2 = Car.create_bmw(2018);
  bmw2.setName = "BMW X-Alpha";
  print("${bmw2.getName} ${bmw2.info()} ${bmw2.is_fast()}");

  // var tesla = Car("Tesla", "Model Y", 2019);
  var tesla = Tesla("Model Y", 2019);

  print("${tesla.info()} ${tesla.is_fast()}");
  tesla.name = "Tesla";
  tesla.model = "Model Z";
  tesla.year = 2017;
  print("${tesla.info()} ${tesla.is_fast(true)}");

  print("$tesla, ${tesla.runtimeType}");

}
