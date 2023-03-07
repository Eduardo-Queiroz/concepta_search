String formatPercentage(double? percentage) {
  return '${placeholderNumber(
    value: (percentage! * 100).round(),
  )}%';
}

String placeholderNumber({
  num? value,
  String placeholder = 'N/D',
}) {
  if (value == null) return placeholder;

  return value.toString();
}
