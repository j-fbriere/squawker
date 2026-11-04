class ClientTransactionIdException implements Exception {
  final String message;

  const ClientTransactionIdException(this.message);

  @override
  String toString() => message;
}

const clientTransactionIdReportMarker = '<!-- quax:client-transaction-id -->';
