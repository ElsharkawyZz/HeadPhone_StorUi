import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:headphone/component/constant.dart';
import 'package:headphone/component/size.dart';
import 'package:headphone/model/product_model/product_model.dart';
import 'package:headphone/screens/product_screen/product_screen.dart';

class ListBigCard extends StatelessWidget {
  const ListBigCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.getScreenPropotionHeight(300),
      width: double.infinity,
      child: ListView.builder(
          itemBuilder: (context, index) {
            return BigCard(
              width: SizeConfig.getScreenPropotionWidth(200),
              hight: SizeConfig.getScreenPropotionHeight(300),
              ontap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductScreen(model:ProductModel.demoProducts[index])));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      ProductModel.demoProducts[index].name,
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text(
                      ProductModel.demoProducts[index].modelNo,
                      style: const TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
                  Center(
                    child: Image(
                      image: AssetImage(
                          ProductModel.demoProducts[index].images[0]),
                      height: 130,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: const BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Row(
                        children: [
                          Text(
                            '\$${ProductModel.demoProducts[index].price} ',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          const Spacer(),
                          RatingBar.builder(
                            initialRating:
                                ProductModel.demoProducts[index].rating,
                            itemSize: 17,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount:
                                ProductModel.demoProducts[index].rating.toInt(),
                            itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                            onRatingUpdate: (rating) {

                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: ProductModel.demoProducts.length),
    );
  }
}

class BigCard extends StatelessWidget {
   const BigCard(
      {Key? key, required this.child,
      required this.ontap,
      required this.width,
      required this.hight}) : super(key: key);
  final Function ontap;
  final Widget child;
  final double width;
  final double hight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
          width: width,
          height: hight,
          margin: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.16),
                    blurRadius: 12,
                    offset: const Offset(0, 3))
              ]),
          child: child),
    );
  }
}
