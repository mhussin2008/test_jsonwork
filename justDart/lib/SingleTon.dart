class SingletonClass {
  bool? debugMode;


  /// Always return a singleton instance
  static final SingletonClass _instance = SingletonClass._internal();

  /// Internal Constructor
  SingletonClass._internal();

  /// Consumable Constructor
  factory SingletonClass({bool debugMode = false}) {
    // Set null class parameters
    _instance.debugMode ??= debugMode;

    return _instance;
  }
}

void main() {
  SingletonClass firstSingleton=SingletonClass(debugMode: false );
  SingletonClass secondSingleton=SingletonClass(debugMode: true );
  print(firstSingleton.hashCode);
  print(secondSingleton.hashCode);



}