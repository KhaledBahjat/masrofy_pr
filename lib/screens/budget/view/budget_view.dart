import 'package:material_ui/material_ui.dart';
import 'package:masrofy/core/constants.dart';
import 'package:masrofy/core/mock_data.dart';
import 'package:masrofy/core/utills/custom_app_bar.dart';
import 'package:masrofy/screens/budget/view/widgets/budget_widget.dart';

class BudgetView extends StatefulWidget {
  const BudgetView({super.key});

  @override
  State<BudgetView> createState() => _BudgetViewState();
}

class _BudgetViewState extends State<BudgetView> {
  final TextEditingController _searchController = TextEditingController();

  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final allTransactions = MockData.transactions;

    final filteredTransactions = _searchQuery.isEmpty
        ? allTransactions
        : allTransactions.where((transaction) {
            final query = _searchQuery.toLowerCase();

            return transaction.category.toLowerCase().contains(query) ||
                transaction.description.toLowerCase().contains(query);
          }).toList();

    final totalExpenses = MockData.totalOutcome;
    final totalIncome = MockData.totalIncome;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: CustomAppBar(
          width: width,
          text: 'Budget',
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.019),

            // SEARCH BAR
            TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.trim();
                });
              },
              decoration: InputDecoration(
                hintText: "Search for a transaction...",
                filled: true,
                fillColor: kPrimaryColor,
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          _searchController.clear();

                          setState(() {
                            _searchQuery = '';
                          });
                        },
                      )
                    : const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),

            SizedBox(height: height * 0.015),

            // LIST OF TRANSACTIONS
            if (filteredTransactions.isEmpty)
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.06,
                ),
                child: const Center(
                  child: Text(
                    "No transactions found",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredTransactions.length,
                itemBuilder: (context, index) {
                  final transaction = filteredTransactions[index];

                  final isExpense =
                      transaction.transactionType == 'expense';

                  return BudgetWidget(
                    type: transaction.transactionType,
                    height: height,
                    width: width,
                    date:
                        "${transaction.date.day}/${transaction.date.month}/${transaction.date.year}",
                    amount: isExpense
                        ? "-£${transaction.amount.toStringAsFixed(0)}"
                        : "+£${transaction.amount.toStringAsFixed(0)}",
                    title: transaction.category,
                    place: transaction.description,
                    icon: MockData.getCategoryIcon(
                      transaction.category,
                    ),
                  );
                },
              ),

            SizedBox(height: height * 0.02),

            // TOTAL EXPENSES & INCOME CARD
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: kDarkGrey,
                  border: Border(
                    left: BorderSide(
                      color: Colors.redAccent,
                      width: 3,
                    ),
                    right: BorderSide(
                      color: Color.fromARGB(255, 39, 135, 66),
                      width: 3,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // TOTAL EXPENSES
                    Column(
                      children: [
                        Text(
                          "Total expenses:",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.04,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          "-£${totalExpenses.toStringAsFixed(2)}",
                          style: TextStyle(
                            color: const Color(0xffFF383C),
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.045,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 60,
                      child: VerticalDivider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),

                    // TOTAL INCOME
                    Column(
                      children: [
                        Text(
                          "Total income:",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.04,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          "+£${totalIncome.toStringAsFixed(2)}",
                          style: TextStyle(
                            color: const Color.fromARGB(
                              255,
                              39,
                              135,
                              66,
                            ),
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.045,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: height * 0.02),
          ],
        ),
      ),
    );
  }
}