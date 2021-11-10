import 'package:bazmi_shop/pages/about/about_page.dart';
import 'package:bazmi_shop/pages/category/category_page.dart';
import 'package:bazmi_shop/pages/dashboard/dashboard_page.dart';
import 'package:bazmi_shop/pages/home/home_page.dart';
import 'package:bazmi_shop/pages/setting/binding/bind_setting.dart';
import 'package:bazmi_shop/pages/setting/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
//  MobileAds.instance.initialize();
  MobileAds.instance.initialize();
  runApp(GetMaterialApp(

    getPages: [
      GetPage(name: '/dashboard', page: ()=> DashboardPage()),
      GetPage(name: '/home', page: ()=> HomePage()),
      GetPage(name: '/category', page: ()=> CategoryPage()),
      GetPage(name: '/setting', page: ()=> SettingPage() , binding : BindSetting()),
      GetPage(name: '/about', page: ()=> AboutPage()),

    ],

   initialRoute: '/dashboard',

   // home: DashboardPage(),

  ));
}

