import 'package:bazmi_shop/pages/dashboard/dashboard_page.dart';
import 'package:bazmi_shop/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
//  MobileAds.instance.initialize();
  MobileAds.instance.initialize();
  runApp(const MaterialApp(

    home: DashboardPage(),

  ));
}

