class Singleton1 {
  static Singleton1? _instance;

  Singleton1._internal() {
    print('PRIVATE CONSTRUCTOR');
  }

  static Singleton1 getInstance() {
    _instance ??= Singleton1._internal();
    return _instance!;
  }
}


