class Singleton3 {
  static Singleton3? _instance;

  Singleton3._internal() {
    print('PRIVATE CONSTRUCTOR');
  }

  factory Singleton3() {
    _instance ??= Singleton3._internal();
    return _instance!;
  }
}
