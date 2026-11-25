import 'package:flutter/foundation.dart';
import 'package:masrofy/screens/transaction/model.dart';

class MockUser {
  final String uid;
  final String displayName;
  final String email;
  final String avatarAsset;

  const MockUser({
    required this.uid,
    required this.displayName,
    required this.email,
    required this.avatarAsset,
  });
}

class MockStore extends ChangeNotifier {
  MockStore._() {
    _transactions = MockData.initialTransactions();
  }

  static final MockStore instance = MockStore._();

  late final List<TransactionModel> _transactions;

  List<TransactionModel> get transactions => List.unmodifiable(_transactions);

  double get totalIncome => _transactions
      .where((t) => t.transactionType == 'income')
      .fold(0, (sum, t) => sum + t.amount);

  double get totalOutcome => _transactions
      .where((t) => t.transactionType != 'income')
      .fold(0, (sum, t) => sum + t.amount);

  double get balance => totalIncome - totalOutcome;

  void addTransaction({
    required double amount,
    required String description,
    required String category,
    required String currency,
    required String transactionType,
    required String repetition,
    required DateTime date,
  }) {
    final transaction = TransactionModel(
      id: 'tx-${DateTime.now().millisecondsSinceEpoch}',
      userId: MockData.currentUser.uid,
      amount: amount,
      description: description.isEmpty ? category : description,
      category: category,
      currency: currency,
      transactionType: transactionType,
      repetition: repetition,
      date: date,
    );

    _transactions.insert(0, transaction);
    notifyListeners();
  }

  void deleteTransaction(String transactionId) {
    _transactions.removeWhere((t) => t.id == transactionId);
    notifyListeners();
  }
}

class MockData {
  MockData._();

  static const MockUser currentUser = MockUser(
    uid: 'demo-user-001',
    displayName: 'Ahmed Khaled',
    email: 'ahmed.khaled@masrofy.app',
    avatarAsset: 'assets/images/profile.png',
  );

  static String getCategoryIcon(String category) {
    switch (category) {
      case 'Electronics':
        return 'assets/images/mdi_shopping.png';
      case 'Supermarket purchases':
        return 'assets/images/mdi_shopping (1).png';
      case 'Restaurant lunch':
      case 'Food':
        return 'assets/images/mdi_food.png';
      case 'Car fuel':
      case 'Transport':
        return 'assets/images/roentgen_fuel-station.png';
      case 'Installments':
      case 'Bills':
        return 'assets/images/zondicons_badge.png';
      case 'Monthly income':
      case 'Extra Work':
        return 'assets/images/Ellipse 194 (3).png';
      default:
        return 'assets/images/Group.png';
    }
  }

  static List<TransactionModel> initialTransactions() {
    final now = DateTime.now();
    return [
      TransactionModel(
        id: 'tx-1',
        userId: currentUser.uid,
        amount: 15000,
        description: 'Monthly Salary',
        category: 'Monthly income',
        currency: 'Egyptian pound',
        transactionType: 'income',
        repetition: 'Monthly',
        date: now.subtract(const Duration(days: 15)),
      ),
      TransactionModel(
        id: 'tx-2',
        userId: currentUser.uid,
        amount: 5000,
        description: 'Freelance UI Project',
        category: 'Extra Work',
        currency: 'Egyptian pound',
        transactionType: 'income',
        repetition: 'One time',
        date: now.subtract(const Duration(days: 7)),
      ),
      TransactionModel(
        id: 'tx-3',
        userId: currentUser.uid,
        amount: 4200,
        description: 'Wireless Headphones & Accessories',
        category: 'Electronics',
        currency: 'Egyptian pound',
        transactionType: 'expense',
        repetition: 'One time',
        date: now.subtract(const Duration(days: 5)),
      ),
      TransactionModel(
        id: 'tx-4',
        userId: currentUser.uid,
        amount: 2800,
        description: 'Weekly Groceries',
        category: 'Supermarket purchases',
        currency: 'Egyptian pound',
        transactionType: 'expense',
        repetition: 'Weekly',
        date: now.subtract(const Duration(days: 3)),
      ),
      TransactionModel(
        id: 'tx-5',
        userId: currentUser.uid,
        amount: 2000,
        description: 'Laptop Monthly Installment',
        category: 'Installments',
        currency: 'Egyptian pound',
        transactionType: 'expense',
        repetition: 'Monthly',
        date: now.subtract(const Duration(days: 2)),
      ),
      TransactionModel(
        id: 'tx-6',
        userId: currentUser.uid,
        amount: 1200,
        description: 'Team Lunch Downtown',
        category: 'Restaurant lunch',
        currency: 'Egyptian pound',
        transactionType: 'expense',
        repetition: 'One time',
        date: now.subtract(const Duration(days: 1)),
      ),
      TransactionModel(
        id: 'tx-7',
        userId: currentUser.uid,
        amount: 800,
        description: 'Full Tank Fuel',
        category: 'Car fuel',
        currency: 'Egyptian pound',
        transactionType: 'expense',
        repetition: 'Weekly',
        date: now,
      ),
    ];
  }
}
