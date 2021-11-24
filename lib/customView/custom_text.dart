import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
  // const CustomText({Key? key}) : super(key: key);

  String title;
  double size;

  CustomText(this.title, this.size);


  @override
  Widget build(BuildContext context) {
    return Text(

        title, style: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: size,
        fontFamily:'BNAZANIN'
    )
    );
  }
}
