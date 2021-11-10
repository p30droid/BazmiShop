import 'package:bazmi_shop/api/post_api.dart';
import 'package:bazmi_shop/models/base_model.dart';
import 'package:bazmi_shop/utils/admob_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:logger/logger.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final logger = Logger();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final dio = Dio();

    final client = RestClient(dio);

    AdmobService.intestialLoad();



    client.getHome().then((BaseModel it) => logger.i(it)).catchError((onError){
      print(onError);

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: AdWidget(
            key: UniqueKey(),
            ad: AdmobService.createBannerAds()..load(),
          ),
        ),
      ),
    );
  }
}
