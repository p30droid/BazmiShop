import 'package:bazmi_shop/customView/custom_text.dart';
import 'package:bazmi_shop/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  Product product;

   ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState(product);
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  Product product;

  _ProductDetailPageState( this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff13b50),
        title: Container(
          width: 120,
          child: CustomText(widget.product.title  , 18),

        ),
        centerTitle: true,
      ),
    );
  }
}
