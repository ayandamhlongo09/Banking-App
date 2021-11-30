import 'dart:io';

class HttpHeaderUtils {
  static Map<String, String> setContentTypeJSON(Map<String, String> headers) {
    return headers == null ? Map<String, String>() : headers
      ..[HttpHeaders.contentTypeHeader] = "application/json";
  }
}
