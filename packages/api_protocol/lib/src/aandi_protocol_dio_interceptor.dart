import 'package:dio/dio.dart';

import 'aandi_protocol_headers.dart';

class AandiProtocolDioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final headers = Map<String, dynamic>.from(options.headers);
    final normalized = <String, String>{
      for (final entry in headers.entries) entry.key: entry.value.toString(),
    };
    mergeAandiProtocolHeaders(normalized);
    options.headers
      ..clear()
      ..addAll(normalized);
    handler.next(options);
  }
}

void ensureAandiProtocolInterceptor(Dio dio) {
  final hasInterceptor = dio.interceptors.any(
    (interceptor) => interceptor is AandiProtocolDioInterceptor,
  );
  if (!hasInterceptor) {
    dio.interceptors.add(AandiProtocolDioInterceptor());
  }
}
