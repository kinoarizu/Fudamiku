part of 'services.dart';

class PaymentServices {
  static final _baseURL = "https://infinite-sea-18742.herokuapp.com/api/midtrans";

  static Future<String> getToken({String cardNumber, String expMonth, String expYear, String cvv}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');

    final response = await Dio().get(_baseURL + '/token', 
      queryParameters: {
        'card_number': cardNumber,
        'card_exp_month': expMonth,
        'card_exp_year': expYear,
        'card_cvv': cvv,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );

    if (response.statusCode == 200) {
      final data = response.data;

      return data['token_id'].toString();
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<ResponseHandler> chargeCreditCard({int amount, String tokenID}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');

    final response = await Dio().post(_baseURL + '/credit',
      data: {
        'token_id': tokenID,
        'gross_amount': amount,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );

    if (response.statusCode == 200) {
      final datas = response.data;

      return ResponseHandler(data: datas);
    } else {
      throw Exception('Failed charge credit card');
    }
  }

  static Future<ResponseHandler> chargeGopay(int amount) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');

    final response = await Dio().post(_baseURL + '/gopay', 
      data: {
        'gross_amount': amount,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );

    if (response.statusCode == 200) {
      final datas = response.data;
      final link = datas['actions'][1];

      return ResponseHandler(data: link);
    } else {
      throw Exception('Failed charge credit card');
    }
  }

}