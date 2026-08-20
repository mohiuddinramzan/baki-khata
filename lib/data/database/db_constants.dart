import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'db_constants.dart';

/// Singleton wrapper around the app's single SQLite database.
///
/// This is the only class that talks to sqflite directly.
/// Repositories can use [database] to get the ready-to-use
/// Database instance.
///
/// Responsibilities:
/// - Open SQLite database
/// - Create database schema
/// - Enable foreign keys
/// - Handle future database migrations
class DatabaseHelper {
  DatabaseHelper._internal();

  static final DatabaseHelper instance = DatabaseHelper._internal();

  static Database? _database;

  /// Returns the open database.
  ///
  /// If the database is not open, it will be initialized first.
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  /// Initializes the SQLite database.
  Future<Database> _initDatabase() async {
    final Directory documentsDirectory =
        await getApplicationDocumentsDirectory();

    final String path = join(
      documentsDirectory.path,
      DbConstants.dbName,
    );

    return openDatabase(
      path,
      version: DbConstants.dbVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      onConfigure: _onConfigure,
    );
  }

  /// Enables SQLite foreign keys.
  ///
  /// This is required for ON DELETE CASCADE to work correctly.
  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  /// Creates all database tables when the database
  /// is created for the first time.
  Future<void> _onCreate(Database db, int version) async {
    // ============================================================
    // CUSTOMERS TABLE
    // ============================================================

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

    // Customer name index
    await db.execute(
      'CREATE INDEX idx_customers_name '
      'ON ${DbConstants.tableCustomers}'
      '(${DbConstants.colCustomerName})',
    );

    // Customer phone index
    await db.execute(
      'CREATE INDEX idx_customers_phone '
      'ON ${DbConstants.tableCustomers}'
      '(${DbConstants.colCustomerPhone})',
    );

    // ============================================================
    // TRANSACTIONS TABLE
    // ============================================================

    await db.execute('''
      CREATE TABLE ${DbConstants.tableTransactions} (
        ${DbConstants.colTransactionId} INTEGER PRIMARY KEY AUTOINCREMENT,

        ${DbConstants.colTransactionCustomerId} INTEGER NOT NULL,

        ${DbConstants.colTransactionType} TEXT NOT NULL
          CHECK (
            ${DbConstants.colTransactionType} IN (
              '${DbConstants.transactionTypeDebt}',
              '${DbConstants.transactionTypePayment}'
            )
          ),

        ${DbConstants.colTransactionAmountPaisa} INTEGER NOT NULL
          CHECK (${DbConstants.colTransactionAmountPaisa} > 0),

        ${DbConstants.colTransactionNote} TEXT,

        ${DbConstants.colTransactionCreatedAt} INTEGER NOT NULL,

        FOREIGN KEY (
          ${DbConstants.colTransactionCustomerId}
        )
        REFERENCES ${DbConstants.tableCustomers} (
          ${DbConstants.colCustomerId}
        )
        ON DELETE CASCADE
      )
    ''');

    // Transaction customer ID index
    await db.execute(
      'CREATE INDEX idx_transactions_customer_id '
      'ON ${DbConstants.tableTransactions}'
      '(${DbConstants.colTransactionCustomerId})',
    );

    // Transaction created date index
    await db.execute(
      'CREATE INDEX idx_transactions_created_at '
      'ON ${DbConstants.tableTransactions}'
      '(${DbConstants.colTransactionCreatedAt})',
    );

    // ============================================================
    // SETTINGS TABLE
    // ============================================================

    await db.execute('''
      CREATE TABLE ${DbConstants.tableSettings} (
        ${DbConstants.colSettingsKey} TEXT PRIMARY KEY,
        ${DbConstants.colSettingsValue} TEXT
      )
    ''');
  }

  /// Handles future database schema upgrades.
  ///
  /// Whenever the database version is increased,
  /// add migration logic here.
  ///
  /// Example:
  ///
  /// if (oldVersion < 2) {
  ///   await db.execute(
  ///     'ALTER TABLE ...',
  ///   );
  /// }
  Future<void> _onUpgrade(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {
    // No migrations yet.
    // Current database schema version is 1.
  }

  /// Closes the database connection.
  ///
  /// Useful for tests or when the database needs
  /// to be reopened cleanly.
  Future<void> close() async {
    final Database? db = _database;

    if (db != null) {
      await db.close();
      _database = null;
    }
  }
}
