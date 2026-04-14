const _defaultDeviceOs = String.fromEnvironment(
  'AANDI_DEVICE_OS',
  defaultValue: 'web',
);

Map<String, String> buildAandiProtocolHeaders() {
  final timestamp = DateTime.now().toUtc().toIso8601String();
  return {'deviceOS': _defaultDeviceOs, 'timestamp': timestamp};
}

void mergeAandiProtocolHeaders(Map<String, String> headers) {
  final protocolHeaders = buildAandiProtocolHeaders();
  for (final entry in protocolHeaders.entries) {
    headers.putIfAbsent(entry.key, () => entry.value);
  }

  final authorization =
      headers.remove('Authorization') ?? headers.remove('authorization');
  final authenticate = headers['Authenticate'] ?? headers['authenticate'];
  final authValue = authenticate ?? authorization;
  if (authValue != null && authValue.isNotEmpty) {
    headers
      ..remove('authenticate')
      ..['Authenticate'] = _normalizeTokenValue(authValue);
  }
}

String _normalizeTokenValue(String value) {
  const bearerPrefix = 'Bearer ';
  if (value.startsWith(bearerPrefix)) {
    return value.trim();
  }
  return '$bearerPrefix${value.trim()}';
}
