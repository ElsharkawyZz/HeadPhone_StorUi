import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:headphone/component/constant.dart';
import 'package:headphone/component/size.dart';
import 'package:headphone/model/product_model/product_model.dart';
import 'package:headphone/screens/component/Card.dart';
import 'package:headphone/screens/product_screen/product_screen.dart';

class Bestseller extends StatelessWidget {
  const Bestseller({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: SizeConfig.getScreenPropotionHeight(400),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Best(
            ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductScreen(
                          model: ProductModel.bestSelling[index])));
            },
            model: ProductModel.bestSelling[index],
          );
        },
        itemCount: ProductModel.bestSelling.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class Best extends StatelessWidget {
  const Best({
    Key? key,
    required this.ontap,
    required this.model,
  }) : super(key: key);
  final Function ontap;
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return BigCard(
      hight: SizeConfig.getScreenPropotionHeight(300),
      width: SizeConfig.getScreenPropotionWidth(300),
      ontap: () {
        ontap();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              model.name,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              model.modelNo,
              style: const TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    model.description,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    model.images[1],
                    width: SizeConfig.getScreenPropotionWidth(100),
                    height: SizeConfig.getScreenPropotionHeight(170),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(
                      20,
                    ),
                    bottomLeft: Radius.circular(
                      20,
                    ))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    '\$${model.price}',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  RatingBar.builder(
                    initialRating: model.rating,
                    itemSize: 17,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: model.rating.toInt(),
                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
