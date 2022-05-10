import 'package:flutter/material.dart';
import 'package:headphone/component/constant.dart';

class ButtonCart extends StatelessWidget {
  const ButtonCart({
    Key? key,
    required this.Ontap,
  }) : super(key: key);
  final Function Ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Ontap();
        },
        child: SizedBox(
          width: 100,
          height: 40,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 90,
                  height: 30,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Cart',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                        alignment: Alignment.center,
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(.12),
                                  offset: const Offset(0, 1),
                                  blurRadius: 10),
                            ],
                            color: Colors.white,
                            border: Border.all(width: 5, color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(40)),
                        child: const Text(
                          '+',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ))),
              )
            ],
          ),
        ));
  }
}