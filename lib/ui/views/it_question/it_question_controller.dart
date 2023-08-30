import 'package:get/get.dart';
import 'package:template/core/data/models/apis/questions_model.dart';
import 'package:template/core/data/repositories/question_repositories.dart';
import 'package:template/core/enums/message_type.dart';
import 'package:template/ui/shared/custom_widgets/custom_showtoast.dart';

class ItQuestionController extends GetxController {
  ItQuestionController(
      {required this.collageName,
      this.materialName = '',
      required this.typeOfQuestion});
  String collageName = '';
  String materialName = '';
  String typeOfQuestion = '';
  RxList<String> groupvalue = <String>[].obs;
  List<QuestionModel> allQuestionsList = <QuestionModel>[].obs;
  RxInt indexOfQuestions = 0.obs;
  RxBool isCorrect = false.obs;
  List<Map<String, String>> answers = [];
  List<bool> chooseQuestions = [];

  // RxInt selectedAnswer = 0.obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    isLoading.value = false;
    getAllQuestions();
    super.onInit();
  }

  void getAllQuestions() {
    QuestionsRepositories.getAllQuestions().then((value) {
      value.fold((l) {
        CustomShowToast.showMessage(
            message: l, messageType: MessageType.REJECTED);
        if (l == 'الرجاء التأكد من الاتصال') {
          Future.delayed(const Duration(seconds: 5))
              .then((value) => getAllQuestions());
        }
      }, (r) {
        for (var element in r) {
          groupvalue.add('');
          chooseQuestions.add(false);
        }
        isLoading.value = true;
        allQuestionsList.addAll(r);
      });
    });
  }
}
