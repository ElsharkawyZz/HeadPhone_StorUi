// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:headphone/component/constant.dart';
import 'package:headphone/cubit/cubit.dart';
import 'package:headphone/cubit/states.dart';
import 'package:headphone/model/categogry_model/category-model.dart';

class Category extends StatelessWidget {
  List cato = CategoryModel.demoCategories;

  Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      builder: (context, state) {
        return SizedBox(
          height: 40,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Card(
                    model: cato[index],
                    active: AppCubit.get(context).inita ==
                        CategoryModel.demoCategories[index].id,
                  ),
              itemCount: cato.length),
        );
      },
      listener: (context, state) {},
    );
  }
}

class Card extends StatelessWidget {
  const Card({Key? key, required this.model, this.active = false}) : super(key: key);

  final CategoryModel model;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppCubit.get(context).changecategorie(model.id);

        // print(model.id);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color:
            active ? kPrimaryColor : Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.16),
                  blurRadius: 4,
                  offset: const Offset(1, 1))
            ]),
        child: Text(
          '${model.name}',
          style: TextStyle(
              color: active
                  ? Colors.white
                  : Colors.grey),
        ),
      ),
    );
  }
}
