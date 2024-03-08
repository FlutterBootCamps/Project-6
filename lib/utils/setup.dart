import 'package:flutter_week6_day3_lab/data_layer/home_data_layer.dart';
import 'package:get_it/get_it.dart';

void setup(){

  GetIt.I.registerSingleton<HomeData>(HomeData());
}