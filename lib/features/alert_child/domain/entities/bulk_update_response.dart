class BulkUpdateResponse<T> {
  final bool ok;
  final String message;
  final List<T> data;

  const BulkUpdateResponse({
    required this.ok,
    required this.message,
    required this.data,
  });
}
