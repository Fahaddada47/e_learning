

import 'dart:ui';

import 'package:e_learning/features/data/model/course_model.dart';
import 'package:e_learning/features/data/network/network_api_services.dart';


class HomeRepository {

  final _apiService  = NetworkApiServices() ;

  Future<CourseModel> courseListApi() async{
    dynamic response = await _apiService.getApi("https://getlearn-admin.getbuildfirst.com/api/course/details/1");
    return CourseModel.fromJson(response) ;
  }


}