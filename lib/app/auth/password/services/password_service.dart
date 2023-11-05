import '../../../../config/interceptor/interceptor.dart';

class PasswordService {
  Future<bool> signup(String id, String fullName) async {
    AppInterceptor.showLoader();
    Map<String, String> data = {
      "full_name": fullName,
      "id": id,
    };
    await Future.delayed(const Duration(seconds: 3), () {
      AppInterceptor.hideLoader();

      return true;
    });
    return false;
    /* AppInterceptor.dio?.post(EndPoints.LOGIN_URL, data: data).then(
      (Response response) {
        if (response.statusCode == 200) {
          return true;
        }
      },
    );*/
  }
}
