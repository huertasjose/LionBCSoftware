import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';

import 'package:ff_commons/api_requests/api_paging_params.dart';

export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ReporteDeServiciosCall {
  static Future<ApiCallResponse> call() async {
    final ffApiRequestBody = '''
{
  "template_id": "c3977b233437ae26",
  "export_type": "json",
  "expiration": 10,
  "output_file": "my_new.pdf",
  "data": {
    "invoice_number": "INV38379",
    "date": "2021-09-30",
    "currency": "USD",
    "total_amount": 82542.56,
    "client": {
      "company_name": "Osiris Pte Ltd",
      "postcode": "86000",
      "country": "Singapore"
    },
    "items": [
      {
        "project": "Polaris",
        "project_manager": "Louise Cole",
        "sub_total_amount": 780,
        "item_lines": [
          {
            "name": "Brand Guide",
            "man_hour": 2,
            "unit": "hour",
            "unit_price": 120,
            "item_total": 240
          },
          {
            "name": "Software Development",
            "man_hour": 17,
            "unit": "hour",
            "unit_price": 20,
            "item_total": 340
          },
          {
            "name": "Landing Page Design",
            "man_hour": 4,
            "unit": "hour",
            "unit_price": 20,
            "item_total": 80
          },
          {
            "name": "Jersey",
            "man_hour": 2,
            "unit": "hour",
            "unit_price": 60,
            "item_total": 120
          }
        ]
      },
      {
        "project": "Alpha",
        "project_manager": "Mason Simpson",
        "sub_total_amount": 4200,
        "item_lines": [
          {
            "name": "Social Media Page",
            "man_hour": 31,
            "unit": "hour",
            "unit_price": 120,
            "item_total": 3720
          },
          {
            "name": "AWS Server Setup",
            "man_hour": 8,
            "unit": "hour",
            "unit_price": 60,
            "item_total": 480
          }
        ]
      },
      {
        "project": "Mariner",
        "project_manager": "Jessica Archer",
        "sub_total_amount": 3675,
        "item_lines": [
          {
            "name": "Social Media Page",
            "man_hour": 34,
            "unit": "hour",
            "unit_price": 45,
            "item_total": 1530
          },
          {
            "name": "App Design",
            "man_hour": 13,
            "unit": "hour",
            "unit_price": 45,
            "item_total": 585
          },
          {
            "name": "IT Consulting",
            "man_hour": 6,
            "unit": "hour",
            "unit_price": 60,
            "item_total": 360
          },
          {
            "name": "Software Development",
            "man_hour": 31,
            "unit": "hour",
            "unit_price": 20,
            "item_total": 620
          },
          {
            "name": "App Design",
            "man_hour": 5,
            "unit": "hour",
            "unit_price": 20,
            "item_total": 100
          },
          {
            "name": "App Design",
            "man_hour": 6,
            "unit": "hour",
            "unit_price": 80,
            "item_total": 480
          }
        ]
      },
      {
        "project": "Osiris",
        "project_manager": "Kian Tucker",
        "sub_total_amount": 8975,
        "item_lines": [
          {
            "name": "AWS Server Setup",
            "man_hour": 7,
            "unit": "hour",
            "unit_price": 80,
            "item_total": 560
          },
          {
            "name": "Social Media Page",
            "man_hour": 33,
            "unit": "hour",
            "unit_price": 120,
            "item_total": 3960
          },
          {
            "name": "Jersey",
            "man_hour": 3,
            "unit": "hour",
            "unit_price": 45,
            "item_total": 135
          },
          {
            "name": "Brand Guide",
            "man_hour": 8,
            "unit": "hour",
            "unit_price": 60,
            "item_total": 480
          },
          {
            "name": "AWS Server Setup",
            "man_hour": 32,
            "unit": "hour",
            "unit_price": 120,
            "item_total": 3840
          }
        ]
      },
      {
        "project": "Polaris",
        "project_manager": "Louise Cole",
        "sub_total_amount": 7425,
        "item_lines": [
          {
            "name": "Flyer",
            "man_hour": 30,
            "unit": "hour",
            "unit_price": 20,
            "item_total": 600
          },
          {
            "name": "Business Card",
            "man_hour": 32,
            "unit": "hour",
            "unit_price": 120,
            "item_total": 3840
          },
          {
            "name": "Social Media Page",
            "man_hour": 30,
            "unit": "hour",
            "unit_price": 80,
            "item_total": 2400
          },
          {
            "name": "Business Card",
            "man_hour": 13,
            "unit": "hour",
            "unit_price": 45,
            "item_total": 585
          }
        ]
      }
    ],
    "gross_total": 25055
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Reporte de Servicios',
      apiUrl: 'https://api.craftmypdf.com/v1/create',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'X-API-KEY': '71caMTczMTk6MTc0MDc6NE1YVlN6ajhnUUpjWEQ1aw=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.file''',
      ));
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
