import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:headphone/component/constant.dart';
import 'package:headphone/component/size.dart';
import 'package:headphone/cubit/cubit.dart';
import 'package:headphone/cubit/states.dart';

import 'package:headphone/screens/component/Card.dart';
import 'package:headphone/screens/component/Searchbar.dart';
import 'package:headphone/screens/component/bestselling.dart';
import 'package:headphone/screens/component/category.dart';



class MayHome extends StatelessWidget {
  const MayHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: kPrimaryColor,
              appBar: appBarView(
                  title: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(left: 20),
                        width: 35,
                        height: 35,
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
                              Icons.menu,
                              color: kPrimaryColor,
                              size: 20,
                            ),
                            onPressed: () {}),
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
              body: Container(
                margin: const EdgeInsets.only(top: 30),
                width: double.infinity,
                height: SizeConfig.screenHeight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Explor your \nfavorite products',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Searchbar(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                              topRight: Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 40, bottom: 10, right: 25, left: 25),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Category(),
                              const SizedBox(
                                height: 30,
                              ),
                              const ListBigCard(),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Best Selling',
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Bestseller()
                            ],
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            );
          },
          listener: (context, state) {}),
    );
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
}
