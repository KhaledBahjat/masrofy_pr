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

// ================= STATISTICS MODEL =================

class MockCategoryStatistic {
  final String category;
  final double percentage;

  const MockCategoryStatistic({
    required this.category,
    required this.percentage,
  });
}

// ================= MOCK DATA =================

class MockData {
  MockData._();

  // ================= USER =================

  static const MockUser currentUser = MockUser(
    uid: 'demo-user-001',
    displayName: 'Ahmed Khaled',
    email: 'ahmed.khaled@masrofy.app',
    avatarAsset: 'assets/images/profile.png',
  );

  // ================= BALANCE =================

  static const double totalIncome = 20000.0;
  static const double totalOutcome = 11000.0;
  static const double balance = 9000.0;

  // ================= INCOME STATISTICS =================

  static const List<MockCategoryStatistic> incomeStatistics = [
    MockCategoryStatistic(
      category: 'Monthly income',
      percentage: 75,
    ),
    MockCategoryStatistic(
      category: 'Extra Work',
      percentage: 25,
    ),
  ];

  // ================= EXPENSE STATISTICS =================

  static const List<MockCategoryStatistic> outcomeStatistics = [
    MockCategoryStatistic(
      category: 'Electronics',
      percentage: 38.2,
    ),
    MockCategoryStatistic(
      category: 'Supermarket purchases',
      percentage: 25.5,
    ),
    MockCategoryStatistic(
      category: 'Installments',
      percentage: 18.2,
    ),
    MockCategoryStatistic(
      category: 'Restaurant lunch',
      percentage: 10.9,
    ),
    MockCategoryStatistic(
      category: 'Car fuel',
      percentage: 7.2,
    ),
  ];

  // ================= TRANSACTIONS =================

  static final List<TransactionModel> transactions =
      List.unmodifiable([
    TransactionModel(
      id: 'tx-1',
      userId: currentUser.uid,
      amount: 15000,
      description: 'Monthly Salary',
      category: 'Monthly income',
      currency: 'Egyptian pound',
      transactionType: 'income',
      repetition: 'Monthly',
      date: DateTime(2026, 11, 10),
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
      date: DateTime(2026, 11, 18),
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
      date: DateTime(2026, 11, 20),
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
      date: DateTime(2026, 11, 22),
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
      date: DateTime(2026, 11, 23),
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
      date: DateTime(2026, 11, 24),
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
      date: DateTime(2026, 11, 25),
    ),
  ]);

  // ================= CATEGORY ICONS =================

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
}