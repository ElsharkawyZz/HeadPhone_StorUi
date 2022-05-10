
import 'package:flutter/material.dart';
import 'package:headphone/component/constant.dart';


class Searchbar extends StatelessWidget {
  const Searchbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)),
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 13),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20)),
                  hintText: 'Search',
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: const Icon(
                    Icons.search,
                    color: kPrimaryColor,
                  )),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white),
          child: IconButton(
            icon: const Icon(
              Icons.filter_alt_outlined,
              color: kPrimaryColor,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}