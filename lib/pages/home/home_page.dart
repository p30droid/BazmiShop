import 'package:bazmi_shop/api/post_api.dart';
import 'package:bazmi_shop/customView/custom_text.dart';
import 'package:bazmi_shop/models/base_model.dart';
import 'package:bazmi_shop/pages/productDetail/product_detail_page.dart';
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

  late Future<BaseModel> allData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final dio = Dio();

    final client = RestClient(dio);

    AdmobService.intestialLoad();

    allData = client.getHome();

    /* client.getHome().then((BaseModel it) => logger.i(it)).catchError((onError){
      print(onError);

    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Center(
        child: FutureBuilder<BaseModel>(
            future: allData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.news.length,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ]),
                                height: 200,
                                width: MediaQuery.of(context).size.width - 20,
                                child: Card(
                                  child: Image.network(
                                      snapshot.data!.news[index].icon,
                                      fit: BoxFit.fill),
                                ),
                              );
                            }),
                      ),
                      Container(
                        margin: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText('نمایش همه', 16),
                            CustomText('جدیدترین موبایل ها', 16)
                          ],
                        ),
                      ),
                      Container(
                        height: 144,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.mobile.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(

                                onTap: () {

                                  Navigator.push(context,MaterialPageRoute(builder: (context )=>ProductDetailPage(product: snapshot.data!.mobile[index])));

                                },

                                child:  Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                  ),
                                  height: 144,
                                  width: 144,
                                  child: Card(
                                    child: Image.network(
                                        snapshot.data!.mobile[index].icon,
                                        fit: BoxFit.cover),
                                  ),
                                ),

                              );
                            }),
                      ),
                      Container(
                        margin: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText('نمایش همه', 16),
                            CustomText('لوازم آرایشیو بهداشتی ', 16)
                          ],
                        ),
                      ),
                      Container(
                        height: 144,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.makeup.length,
                            itemBuilder: (context, index) {
                              
                              
                              
                              return GestureDetector(
                                
                                onTap: () {
                                  
                                  Navigator.push(context,MaterialPageRoute(builder: (context )=>ProductDetailPage(product: snapshot.data!.makeup[index])));
                                  
                                },
                                
                                child:  Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                  ),
                                  height: 144,
                                  width: 144,
                                  child: Card(
                                    child: Image.network(
                                        snapshot.data!.makeup[index].icon,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                
                                
                              );
                            }),
                      ),

                    ],
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            }),
      )),
    );
  }
}
