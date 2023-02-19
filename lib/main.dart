import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/modules/home/controllers/home_controller.dart';
import 'routes/app_pages.dart';

String? deviceToken;
RxBool darkMode = false.obs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final homeController = Get.put(HomeController());
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false, home: MyEcommerce()));
}

class MyEcommerce extends StatefulWidget {
  const MyEcommerce({Key? key}) : super(key: key);

  @override
  State<MyEcommerce> createState() => _MyEcommerceState();
}

class _MyEcommerceState extends State<MyEcommerce> {
  bool isFirstUser = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness:
            darkMode.value ? Brightness.dark : Brightness.light,
      ),
    );
    ScreenUtil.init(context,
        designSize:
            MediaQueryData.fromWindow(WidgetsBinding.instance.window).size);
    return GetMaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: ThemeData(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedLabelStyle:
                  TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
              unselectedLabelStyle:
                  TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600))),
    );
  }
}
