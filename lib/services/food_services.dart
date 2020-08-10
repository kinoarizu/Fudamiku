part of 'services.dart';

class FoodServices {
  static final _getURL = 'https://infinite-sea-18742.herokuapp.com/api/foods';

  static Future<List<Food>> getFoods() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');

    final response = await http.get(_getURL, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      List foods = json['data'];

      return foods.map((e) => Food.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}