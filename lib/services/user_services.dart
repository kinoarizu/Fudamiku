part of 'services.dart';

class UserServices {
  static final _getURL = 'https://infinite-sea-18742.herokuapp.com/api/user/';

  static Future<User> getUser(int id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userID = preferences.getInt('id');
    var token = preferences.getString('token');

    final response = await http.get(_getURL + userID.toString(), headers: {
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
}
