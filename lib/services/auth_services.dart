part of 'services.dart';

class AuthServices {
  /// API URL
  static final String _loginURL = 'https://infinite-sea-18742.herokuapp.com/api/auth/login';
  static final String _registerURL = 'https://infinite-sea-18742.herokuapp.com/api/auth/register';

  /// Register Method
  static Future<ResponseHandler> signUp(Auth auth) async {
    FormData registerData = FormData.fromMap({
      'name': auth.name,
      'email': auth.email,
      'password': auth.password,
      'password_confirmation': auth.confirmPassword,
      'phone_number': auth.phoneNumber,
      'address': auth.address,
      'house_number': auth.houseNumber,
      'city': auth.city,
      'photo': (auth.photo != null) ? await MultipartFile.fromFile(auth.photo.path, filename: basename(auth.photo.path)) : null
    });

    final response = await Dio().post(_registerURL, data: registerData, options: Options(followRedirects: false, validateStatus: (status) { return status < 500; }));
    final json = response.data;

    if (response.statusCode == 200) {
      User user = User.fromJson(json['user']);

      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('token', json['token']);
      preferences.setInt('id', json['user']['id']);

      return ResponseHandler(
        user: user,
        message: json['message'],
      );
    } else if (response.statusCode == 422) {
      if (json['errors']['name'] != null) {
        return ResponseHandler(
          errors: "Min length name is 3",
        );
      } else if (json['errors']['phone_number'] != null) {
        return ResponseHandler(
          errors: "Phone number has already registered",
        );
      } else {
        return ResponseHandler(
          errors: "Max size image file id 5 MB",
        );
      }
    } else {
      return ResponseHandler(
        errors: "Email has already registered",
      );
    }
  }

  /// Login Method
  static Future<ResponseHandler> signIn(Auth auth) async {
    final response = await http.post(_loginURL, body: {
      'email': auth.email,
      'password': auth.password,
    });

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      User user = User.fromJson(json['user']);

      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('token', json['token']);
      preferences.setInt('id', json['user']['id']);

      return ResponseHandler(
        user: user,
        message: json['message'],
      );
    } else if (response.statusCode == 422) {
      return ResponseHandler(
        message: "Please enter valid email",
      );
    } else {
      return ResponseHandler(
        message: "Email or Password is Wrong",
      );
    }
  }

  /// Logout Method
  static Future<void> signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('token');
  }
}