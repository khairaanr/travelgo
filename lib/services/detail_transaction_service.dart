import 'dart:convert';

import 'package:travelgo/models/transaction_detail_model.dart';

import '../shared/api_response.dart';
import '../shared/constant.dart';
import 'package:http/http.dart' as http;

Future<ApiResponse> detailTransaction(String transactionId, String name, String nik) async {
  var url = Uri.parse(makeTransactionDetailURL);
  ApiResponse apiResponse = ApiResponse();

  try {
    final response = await http.post(url, headers: {
      "Accept": "application/json"
    }, body: {
      "transactions_id": transactionId,
      "name": name,
      "nik_ktp": nik,
    });

    print(response.body);

    switch (response.statusCode) {
      case 200:
        apiResponse.data = TransactionDetail.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elemenAt(0)][0];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      default:
        apiResponse.error = "Something went wrong, try again!";
        break;
    }
  } catch (e) {
    print(e);
    apiResponse.error = "Server error";
  }

  return apiResponse;
}