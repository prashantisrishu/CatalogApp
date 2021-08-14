import 'dart:convert';
import 'package:catalogapp/utils/routes.dart';
import 'package:catalogapp/widget/home_widgets/catalog_header.dart';
import 'package:catalogapp/widget/home_widgets/catalog_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:catalogapp/models/model.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
      .map<Item>((item) => Item.fromMap(item))
      .toList(); 
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(20, (index) => CatalogModel.items[0]); //dummyList Generator
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, MyRoutes.cartRoute);
        },
        backgroundColor: context.theme.buttonColor,
        child: Icon(CupertinoIcons.cart , color: Colors.white,),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              CatalogHeader(),
              // ignore: unnecessary_null_comparison
              if(CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ]
          ),
        ),
      ),
    );
  }
}
 






