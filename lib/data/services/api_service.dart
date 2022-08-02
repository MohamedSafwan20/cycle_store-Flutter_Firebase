import 'dart:convert';

import 'package:http/http.dart';

class ApiService {
  static const PINCODE_API_URL = "https://api.postalpincode.in/pincode";

  static Future<Map> getLocationFromPincode(String pincode) async {
    try {
      final Response res = await get(Uri.parse("$PINCODE_API_URL/$pincode"));
      final List jsonData = jsonDecode(res.body);
      if (jsonData[0]["Status"] != "Success") {
        throw Exception("Pincode not found");
      }

      return {
        "status": true,
        "city": jsonData[0]["PostOffice"][0]["Name"],
        "district": jsonData[0]["PostOffice"][0]["District"],
        "state": jsonData[0]["PostOffice"][0]["State"]
      };
    } catch (e) {
      return {"status": false, "city": "", "state": ""};
    }
  }
}
