part of 'services.dart';

class UserServices {
  static final _baseURL = 'https://infinite-sea-18742.herokuapp.com/api/user/';

  static Future<User> getUser(int id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userID = preferences.getInt('id');
    var token = preferences.getString('token');

    final response = await http.get(_baseURL + userID.toString(), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      User user = User.fromJson(json['data']);

      return user;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<void> updateUser(User user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userID = preferences.getInt('id');
    var token = preferences.getString('token');

    FormData userData = FormData.fromMap({
      'name': user.name,
      'phone_number': user.phoneNumber,
      'address': user.address,
      'house_number': user.houseNumber,
      'city': user.city,
      'photo': (user.newPhoto != null) ? await MultipartFile.fromFile(user.newPhoto.path, filename: basename(user.newPhoto.path)) : null
    });

    await Dio().post(_baseURL + userID.toString() + '?_method=PUT',
      data: userData,
      options: Options(
        followRedirects: false, 
        validateStatus: (status) {
          return status < 500;
        },
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }
}
