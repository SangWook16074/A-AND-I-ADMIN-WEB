import 'package:http/http.dart' as http;

import 'aandi_protocol_headers.dart';

class AandiProtocolHttpClient extends http.BaseClient {
  AandiProtocolHttpClient(this._inner);

  final http.Client _inner;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    mergeAandiProtocolHeaders(request.headers);
    return _inner.send(request);
  }

  @override
  void close() {
    _inner.close();
  }
}

http.Client wrapWithAandiProtocolClient(http.Client client) {
  if (client is AandiProtocolHttpClient) {
    return client;
  }
  return AandiProtocolHttpClient(client);
}
