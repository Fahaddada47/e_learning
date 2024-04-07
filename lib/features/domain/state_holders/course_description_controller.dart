
import 'package:e_learning/features/data/model/course_model.dart';
import 'package:e_learning/features/data/response/status.dart';
import 'package:e_learning/features/domain/repository/home-repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final courseList = CourseModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setcourseList(CourseModel _value) => courseList.value = _value;
  void setError(String _value) => error.value = _value;

  void courseListApi() {
    _api.courseListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setcourseList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  void refreshApi() {
    setRxRequestStatus(Status.LOADING);
    _api.courseListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setcourseList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}