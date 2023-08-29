import 'package:get/get.dart';
import 'package:template/core/data/models/apis/term_model.dart';
import 'package:template/core/data/repositories/term_repositories.dart';
import 'package:template/core/enums/message_type.dart';
import 'package:template/ui/shared/custom_widgets/custom_showtoast.dart';

class CoursesController extends GetxController {
  CoursesController(this.collageName, this.materialName);
  final String collageName;
  final String materialName;
  RxList<TermModel> allTermList = <TermModel>[].obs;

  @override
  void onInit() {
    getAllTerms();
    super.onInit();
  }

  void getAllTerms() {
    TermRepositories.allSlider().then((value) {
      value.fold((l) {
        CustomShowToast.showMessage(
            message: l, messageType: MessageType.REJECTED);
        if (l == 'الرجاء التأكد من الاتصال') {
          Future.delayed(const Duration(seconds: 5))
              .then((value) => getAllTerms());
        }
      }, (r) {
        allTermList.addAll(r);
      });
    });
  }
}
