import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ApiService extends GetConnect {

  ApiService() {
    httpClient.baseUrl = 'https://api.nimbbl.tech/api/v3';
  }

  @override
  void onInit() {
    httpClient.baseUrl = 'https://api.nimbbl.tech/api/v3';
    super.onInit();
  }

  // Method to generate token
  Future<Response> generateToken(String accessKey, String accessSecret) async {
    final response = await post(
      '/generate-token',
      {
        'access_key': "access_key_6EAvqqg82qg9LvPD",
        'access_secret': "access_secret_1DvejxdkRxQZ63KB",
      },
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    debugPrint('token values from nimble--> ${response}');
    return response;
  }

  Future<Response> generateOrderId(String token) async {
    final response = await post(
      '/create-order',
      {
        "amount_before_tax": 2100,
        "tax": 105,
        "total_amount": 2205,
        "user": {
          "email": "wonderwoman@themyscira.gov",
          "first_name": "Diana",
          "last_name": "Prince",
          "country_code": "+91",
          "mobile_number": "9585313659"
        },
        "shipping_address": {
          "address_1": "1080 Beach Mansion",
          "street": "Magic Beach Drive",
          "landmark": "Opposite Magic Mountain",
          "area": "Elyria",
          "city": "Atlantis",
          "state": "Castalia",
          "pincode": "100389",
          "address_type": "Beach House"
        },
        "currency": "INR",
        "invoice_id": AutoGenerateString().getNextString(),
        "referrer_platform": "string",
        "referrer_platform_version": "string",
        "order_line_items": [
          {
            "sku_id": "item_2783027490",
            "title": "Best Sliced Alphonso Mango",
            "description": "The Alphonso mango is a seasonal fruit harvested from mid-April through the end of June. The time from flowering to harvest is about 90 days, while the time from harvest to ripening is about 15 days.The fruits generally weigh between 150 and 300 grams (5.3 and 10.6 oz), have a rich, creamy, tender texture and delicate, non-fibrous, juicy pulp. As the fruit matures, the skin of an Alphonso mango turns golden-yellow with a tinge of red across the top of the fruit",
            "image_url": "https://en.wikipedia.org/wiki/Alphonso_mango#/media/File:Alphonso_mango.jpg",
            "rate": 1050,
            "quantity": "2",
            "amount_before_tax": "2100.00",
            "tax": "105.00",
            "total_amount": "2205.00"
          }
        ],
        "bank_account": {
          "account_number": "10038849992883",
          "name": "Diana Prince",
          "ifsc": "ICIC0000011"
        },
        "custom_attributes": {
          "name": "Diana",
          "place": "Themyscira",
          "animal": "Jumpa",
          "thing": "Tiara"
        }
      },
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'},
    );
    debugPrint('token values from nimble--> ${response}');
    return response;
  }
}

class AutoGenerateString {
  String getNextString() {
    String paddedNumber = Random().nextInt(999999999).toString().padLeft(16, '0');
    return "InvoiceID$paddedNumber";
  }
}
