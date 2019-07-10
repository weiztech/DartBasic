class PrivatePublic{
  // class that contains property & method with private and public
  final int _number;
  final int number;

  const PrivatePublic(this._number, this.number);

  int _callPrivate(){
    return _number;
  }

  int callPublic(){
    return number;
  }

  int callPrivateFromPublic(){
    return _callPrivate();
  }
}
