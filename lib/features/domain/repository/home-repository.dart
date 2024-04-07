

import 'dart:ui';

import 'package:e_learning/features/data/model/course_model.dart';
import 'package:e_learning/features/data/network/network_api_services.dart';
import 'package:e_learning/features/data/utility/urls.dart';


class HomeRepository {

  final _apiService  = NetworkApiServices() ;

  Future<CourseModel> courseListApi() async{
    dynamic response = await _apiService.getApi(Urls.getCourse);
    return CourseModel.fromJson(response) ;
  }


}