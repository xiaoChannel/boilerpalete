import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '../../../widgets/common_widget.dart';
import '../../models/error_response.dart';

FutureOr<dynamic> responseInterceptor(Request request, Response response) async {
  EasyLoading.dismiss();

  print(response.bodyString);
  if (response.statusCode != 200 || response.statusCode != 201) {
    handleErrorStatus(response);
    return;
  }

  return response;
}

void handleErrorStatus(Response response) {
  switch (response.statusCode) {
    case 400:
      final message = ErrorResponse.fromJson(response.body);
      CommonWidget.toast(message.error);
      break;
    default:
      CommonWidget.toast(response.bodyString ?? "failed");
  }

  return;
}
