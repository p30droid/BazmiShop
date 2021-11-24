import 'package:flutter/cupertino.dart';

class PersianText extends StatelessWidget {
  // const CustomText({Key? key}) : super(key: key);

  String title;
  double size;

  PersianText(this.title, this.size);


  @override
  Widget build(BuildContext context) {
    return Text(
        title, style: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: size,
        fontFamily:'IRANSans'
    )
    );
  }
}
