class AppInstance{
  static final AppInstance _instance = AppInstance._internal();
  factory AppInstance(){
    return _instance;
  }
  static AppInstance get instance {
    return AppInstance._instance;
  }
  AppInstance._internal();
  bool isAsync =false;
}