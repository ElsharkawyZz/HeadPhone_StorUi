import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:headphone/component/constant.dart';
import 'package:headphone/component/size.dart';
import 'package:headphone/model/product_model/product_model.dart';
import 'package:headphone/screens/component/cart_button.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key, required this.model}) : super(key: key);
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: appBarView(
          title: Row(
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 20),
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.12),
                          offset: const Offset(0, 1))
                    ]),
                child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: kPrimaryColor,
                      size: 15,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
            ],
          ),
          action: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                )),
          ]),
      body: SizedBox(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        child: Column(
          children: [
            SizedBox(
              width: 250,
              height: 250,
              child: PageView.builder(
                itemCount:model.images.length ,
                itemBuilder: (context,index)=>Hero(
                  tag: model.id,
                  child: Image.asset(
                    model.images[index],
                    width: 250,
                    height: 250,
                  )),),
            ),

            Expanded(
                child: Container(
              padding: const EdgeInsets.only(
                top: 30,
                right: 30,
                left: 30,
              ),
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(20))),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${model.price}',
                          style: const TextStyle(
                              color: kPrimaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        ButtonCart(Ontap: () {}),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Photos',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 70,
                      child: ListView.builder(
                          itemCount: model.images.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Image.asset(
                                model.images[index],
                                width: 70,
                              )),
                    ),
                    Text(
                      model.modelNo,
                      style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
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
                        color: kPrimaryColor,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      model.description,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(29),
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () {},
          child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: const Center(
                  child: Text(
                'Buy Now',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ))),
        ),
      ),
    );
  }
}



AppBar appBarView({List<Widget>? action, Widget? title}) {
  return AppBar(
    backgroundColor: kPrimaryColor,
    elevation: 0,
    title: title,
    actions: action,
    automaticallyImplyLeading: false,
    titleSpacing: 0,
  );
}
