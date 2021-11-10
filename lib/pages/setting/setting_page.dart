import 'package:bazmi_shop/models/education_model.dart';
import 'package:bazmi_shop/pages/about/about_page.dart';
import 'package:bazmi_shop/pages/setting/controller/counter_controller.dart';
import 'package:bazmi_shop/pages/setting/controller/setting_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
//  final setting_api = Get.put(SettingService());
  final setting_api = Get.find<SettingService>();

  // final controller = Get.put(CounterController());
  final controller = Get.find<CounterController>();

  //List<String> items= ['Persian','English', 'Arabic'];

  String selectedItem = 'Persian';
   late Education selectedEducation;

  List<Education> educationList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    educationList.add(new Education(title: 'دیپلم', code: '1222000222'));
    educationList.add(new Education(title: 'فوق دیپلم', code: '1222400222'));
    educationList.add(new Education(title: 'لیسانس', code: '12220200222'));

    //selectedEducation =new Education(title: 'دیپلم', code: '1222000222');
    selectedEducation = educationList[0];


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                // Get.to('/about');
                Get.toNamed('about');
              },
              child: Text('About Us')),
          Text('${setting_api.value}'),
          Text('${setting_api.getDataFromServer()}'),
          ElevatedButton(
              onPressed: () {
                controller.increment();
              },
              child: Text("Increment")),
          Obx(() => Text('${controller.count}')),
          ElevatedButton(
              onPressed: () {
                controller.decrement();
              },
              child: Text("Decrement")),
          ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                    title: 'About app', middleText: 'Bazi Shop Store');
              },
              child: Text("Dialog")),
          ElevatedButton(
              onPressed: () {
                Get.snackbar('Hello', "don't back",
                    snackPosition: SnackPosition.BOTTOM);
              },
              child: Text("SnackBar")),
          ElevatedButton(
              onPressed: () {
                Get.changeTheme(ThemeData.light());
              },
              child: Text("Theme")),
          ElevatedButton(
              onPressed: () {
                //  Get.Loca
              },
              child: Text("Locale")),
          DropdownButton<String>(
            items: <String>['Persian', 'English', 'Arabic'].map((String value) {
              return DropdownMenuItem<String>(
                child: Text(value),
                value: value,
              );
            }).toList(),
            hint: Text('Select your language:'),
            value: selectedItem,
            onChanged: (value) {
              setState(() {
                selectedItem = value!;
              });
            },
          ),
          DropdownButton<Education>(
            items: educationList.map((Education value) {
              return DropdownMenuItem<Education>(
                child: Text(value.title),
                value: value,
              );
            }).toList(),

            hint: Text('Select your Major:'),

            value: selectedEducation ,
            onChanged: (value) {

              print('${value!.title} and ${value!.code}');

              setState(() {
                selectedEducation = value!;
              });
            },
          )
        ],
      ),
    );
  }
}
