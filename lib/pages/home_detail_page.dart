import 'package:catalogapp/models/model.dart';
import 'package:catalogapp/pages/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding:EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(catalog: catalog).wh(120, 50),
          ],
        ).p32(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4.color(context.accentColor).bold.make(),
                      catalog.desc.text.xl.make(),
                      10.heightBox,
                      "Sit gubergren elitr sit et ut amet sanctus sadipscing invidunt.Amet sanctus sadipscing invidunt"
                      .text.make().p16(),
                    ],
                  ).py64(),
                  color: context.cardColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}