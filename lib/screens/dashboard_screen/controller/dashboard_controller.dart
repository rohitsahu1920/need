import 'package:get/get.dart';
import 'package:need_flutter_app/res/strings.dart';
import 'package:need_flutter_app/utils/assets.dart';

class DashBoardController extends GetxController{

  final isLoading = true.obs;
  final hasError = false.obs;
  final errorMessage = Strings.wrongMsg.obs;

  List<String> imageList = [Assets.donation1,Assets.donation2,Assets.donation3];

}