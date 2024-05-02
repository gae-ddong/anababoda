import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetAddressCall {
  static Future<ApiCallResponse> call({
    String? format = 'JSON',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get address',
      apiUrl: 'https://dapi.kakao.com/v2/local/search/address.\${FORMAT}',
      callType: ApiCallType.GET,
      headers: {
        'https':
            '//developers.kakao.com/docs/latest/ko/local/dev-guide#address-coord-request-header',
      },
      params: {
        'query': "s",
        'analyze_type': "similar",
        'page': 1,
        'size': 10,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
