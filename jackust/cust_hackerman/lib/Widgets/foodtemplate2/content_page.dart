import 'package:cust_hackerman/Models/foodbase.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';


class ContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(227, 253, 253, 1),
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.start,
          direction: Axis.vertical,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  'EggTart (FoodName) 蛋撻 (中文名)',
                  maxLines: 1,
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ImageView(),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Divider(
                thickness: 1.0,
                color: Colors.black,
              ),
            ),
            PropertyBox(title: 'Description', textbelow: 'This is the section for the description of the food. Briefly describe the taste, maybe history? of the food. Add anything you want.',),
            PropertyBox(title: 'Ingredients', textbelow: 'Milk, Egg',),
            PropertyBox(title: 'Properties', textbelow: 'Calories, Saturated/Trans-fat, sugar, sodium',),
            PropertyBox(title: 'Options', textbelow: 'Puffy Pastry Eggtart / Shortcrust Pastry Eggtart',),
            PropertyBox(title: 'Allergies', textbelow: 'Put some tagchips in here',),
            PropertyBox(title: 'See Also/ Categories', textbelow: 'What did other users also looked for \nUsually for (breakfast/snacks/lunch/dinner)?',),
            Divider(height: 30, thickness: 1.0,),
          ],
        ),
      ),
    );
  }
}

class PropertyBox extends StatelessWidget {

  final String title;
  final String textbelow;
  const PropertyBox({
    Key key,@required this.title,@required this.textbelow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top:8.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0)
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(title, minFontSize: 24, maxLines: 1, maxFontSize: 40, style: TextStyle(fontWeight: FontWeight.bold),),
            Divider(),
            AutoSizeText(textbelow, maxLines: 3, maxFontSize: 30, minFontSize: 20,),
          ],
        ),
      ),
    );
  }
}

class ImageView extends StatelessWidget {
  const ImageView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: CarouselSlider(
          items: [
            for (var i in CCTBreakfast.cctBreakfastImages)
              Container(
                margin: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                        image: AssetImage(i), fit: BoxFit.cover)),
              )
          ],
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height / 2,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 400),
            viewportFraction: 0.8,
          )),
    );
  }
}
