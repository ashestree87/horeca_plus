import 'dart:math';

String formatBytes(int bytes, int decimals) {
  if (bytes <= 0) return '0 B';
  const suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB'];
  final i = min((log(bytes) / log(1024)).floor(), suffixes.length - 1);
  final result = bytes / pow(1024, i);
  return '${result.toStringAsFixed(decimals)} ${suffixes[i]}';
}
