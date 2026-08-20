class DbConstants {
  DbConstants._();

  static const String dbName = 'baki_khata.db';
  static const int dbVersion = 1;

  // customers table
  static const String tableCustomers = 'customers';
  static const String colCustomerId = 'id';
  static const String colCustomerName = 'name';
  static const String colCustomerPhone = 'phone';
  static const String colCustomerAddress = 'address';
  static const String colCustomerNote = 'note';
  static const String colCustomerCreatedAt = 'created_at';
  static const String colCustomerUpdatedAt = 'updated_at';

  // transactions table
  static const String tableTransactions = 'transactions';
  static const String colTransactionId = 'id';
  static const String colTransactionCustomerId = 'customer_id';
  static const String colTransactionType = 'type';
  static const String colTransactionAmountPaisa = 'amount_paisa';
  static const String colTransactionNote = 'note';
  static const String colTransactionCreatedAt = 'created_at';

  static const String transactionTypeDebt = 'DEBT';
  static const String transactionTypePayment = 'PAYMENT';

  // settings table
  static const String tableSettings = 'settings';
  static const String colSettingsKey = 'key';
  static const String colSettingsValue = 'value';
}
