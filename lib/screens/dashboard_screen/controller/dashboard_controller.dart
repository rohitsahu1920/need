import 'package:get/get.dart';
import 'package:need_flutter_app/res/strings.dart';

class DashBoardController extends GetxController{

  final isLoading = true.obs;
  final hasError = false.obs;
  final errorMessage = Strings.wrongMsg.obs;

}