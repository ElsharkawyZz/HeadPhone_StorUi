import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:headphone/cubit/states.dart';
import 'package:headphone/model/categogry_model/category-model.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(initialAppState());

  static AppCubit get(context) => BlocProvider.of(context);

  int inita = 0;
  List cato = CategoryModel.demoCategories;
  bool active = false;
  void changecategorie(indexs) {
    inita = indexs;
    print(inita);
    emit(AppStateChangeCatogeries());
  }
}
