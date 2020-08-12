part of 'services.dart';

class TransactionServices {
  static final _getURL = 'https://infinite-sea-18742.herokuapp.com/api/transactions';

  static Future<Transaction> getTransaction(int orderID) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');

    final response = await http.get(_getURL + '/' + orderID.toString(), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      Transaction transaction = Transaction.fromJson(json['data']);

      return transaction;
    } else {
      throw Exception('Failed to load data');
    }
  }
}