import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'db_constants.dart';

class DatabaseHelper {
  DatabaseHelper._internal();

  static final DatabaseHelper instance = DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final Directory documentsDirectory =
        await getApplicationDocumentsDirectory();
    final String path = join(documentsDirectory.path, DbConstants.dbName);

    return openDatabase(
      path,
      version: DbConstants.dbVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      onConfigure: _onConfigure,
    );
  }

  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${DbConstants.tableCustomers} (
        ${DbConstants.colCustomerId} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${DbConstants.colCustomerName} TEXT NOT NULL,
        ${DbConstants.colCustomerPhone} TEXT,
        ${DbConstants.colCustomerAddress} TEXT,
        ${DbConstants.colCustomerNote} TEXT,
        ${DbConstants.colCustomerCreatedAt} INTEGER NOT NULL,
        ${DbConstants.colCustomerUpdatedAt} INTEGER NOT NULL
      )
    ''');

    await db.execute(
      'CREATE INDEX idx_customers_name ON ${DbConstants.tableCustomers}'
      '(${DbConstants.colCustomerName})',
    );
    await db.execute(
      'CREATE INDEX idx_customers_phone ON ${DbConstants.tableCustomers}'
      '(${DbConstants.colCustomerPhone})',
    );

    await db.execute('''
      CREATE TABLE ${DbConstants.tableTransactions} (
        ${DbConstants.colTransactionId} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${DbConstants.colTransactionCustomerId} INTEGER NOT NULL,
        ${DbConstants.colTransactionType} TEXT NOT NULL
          CHECK (${DbConstants.colTransactionType} IN
            ('${DbConstants.transactionTypeDebt}', '${DbConstants.transactionTypePayment}')),
        ${DbConstants.colTransactionAmountPaisa} INTEGER NOT NULL
          CHECK (${DbConstants.colTransactionAmountPaisa} > 0),
        ${DbConstants.colTransactionNote} TEXT,
        ${DbConstants.colTransactionCreatedAt} INTEGER NOT NULL,
        FOREIGN KEY (${DbConstants.colTransactionCustomerId})
          REFERENCES ${DbConstants.tableCustomers} (${DbConstants.colCustomerId})
          ON DELETE CASCADE
      )
    ''');

    await db.execute(
      'CREATE INDEX idx_transactions_customer_id ON ${DbConstants.tableTransactions}'
      '(${DbConstants.colTransactionCustomerId})',
    );
    await db.execute(
      'CREATE INDEX idx_transactions_created_at ON ${DbConstants.tableTransactions}'
      '(${DbConstants.colTransactionCreatedAt})',
    );

    await db.execute('''
      CREATE TABLE ${DbConstants.tableSettings} (
        ${DbConstants.colSettingsKey} TEXT PRIMARY KEY,
        ${DbConstants.colSettingsValue} TEXT
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // No migrations yet — schema is at version 1.
  }

  Future<void> close() async {
    final db = _database;
    if (db != null) {
      await db.close();
      _database = null;
    }
  }
}
