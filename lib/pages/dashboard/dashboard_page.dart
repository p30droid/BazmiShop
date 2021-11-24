

import 'package:bazmi_shop/customView/custom_text.dart';
import 'package:bazmi_shop/customView/persian_text.dart';
import 'package:bazmi_shop/pages/category/category_page.dart';
import 'package:bazmi_shop/pages/home/home_page.dart';
import 'package:bazmi_shop/pages/setting/controller/counter_controller.dart';
import 'package:bazmi_shop/pages/setting/controller/setting_service.dart';
import 'package:bazmi_shop/pages/setting/setting_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {





  int _currentIndex=0;
  List<Widget> widgets =[
    const HomePage(),
    const CategoryPage(),
    const SettingPage()
  ];

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();

  //  await Firebase.initializeApp();

  //  FirebaseCrashlytics.instance.crash();
   // FirebaseCrashlytics.instance.crash();

  }


  @override
  Widget build(BuildContext context) {

    Get.put(SettingService());
    Get.put(CounterController());


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff13b50),
        title: PersianText(AppLocalizations.of(context)!.app_name , 20),
        centerTitle: true,
      ),

      body: Center(

        child: widgets.elementAt(_currentIndex),

      ),

      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: Color(0xfff13b50),
        selectedIconTheme: IconThemeData(color: Colors.purple),
        selectedItemColor: Colors.black,
        currentIndex:_currentIndex ,
        onTap:onTabTapped ,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home) , label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.category) , label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.settings) , label: 'Setting')

        ],

      ),

    );
  }

  onTabTapped(int index) {

    setState(() {
      _currentIndex = index;
    });

  }

}
