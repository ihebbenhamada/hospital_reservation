import '../../../../config/interceptor/interceptor.dart';

class LoginService {
  Future<bool> loginWithEmailAndPassword(String id, String password) async {
    AppInterceptor.showLoader();
    Map<String, String> data = {
      "id": id,
      "password": password,
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
