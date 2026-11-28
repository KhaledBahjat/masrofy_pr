import 'package:go_router/go_router.dart';
import 'package:masrofy/core/constants.dart';
import 'package:masrofy/core/routes.dart';
import 'package:masrofy/core/utills/custom_app_bar.dart';
import 'package:material_ui/material_ui.dart';

class TransactionView extends StatefulWidget {
  const TransactionView({super.key});

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  final amountController = TextEditingController();
  final descriptionController = TextEditingController();

  String transactionType = "expense";
  String selectedCategory = "Select category";
  String selectedRepetition = "One time";
  DateTime? selectedDate;

  @override
  void dispose() {
    amountController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: CustomAppBar(width: width, text: 'Add Transaction'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),

            // 1. Income / Expense Box
            Container(
              height: 73,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage('assets/images/Frame 14368.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        transactionType = "income";
                      });
                    },
                    child: Opacity(
                      opacity: transactionType == "income" ? 1 : 0.4,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 13,
                            backgroundColor: Color(0xff53D258),
                            child: Icon(Icons.add, size: 15),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Add an Expense',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const VerticalDivider(
                    color: Colors.white,
                    indent: 20,
                    endIndent: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        transactionType = "expense";
                      });
                    },
                    child: Opacity(
                      opacity: transactionType == "expense" ? 1 : 0.4,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 13,
                            backgroundColor: Color(0xffE34747),
                            child: Icon(Icons.remove, size: 15),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Withdraw money',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: height * 0.03),

            // 2. Amount
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Amount",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            SizedBox(height: height * 0.025),

            // 3. Category
            DropdownButtonFormField<String>(
              initialValue: selectedCategory,
              dropdownColor: kPrimaryColor,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              items: const [
                DropdownMenuItem(
                  value: "Select category",
                  child: Text("Select category"),
                ),
                DropdownMenuItem(value: "Food", child: Text("Food")),
                DropdownMenuItem(value: "Transport", child: Text("Transport")),
                DropdownMenuItem(value: "Shopping", child: Text("Shopping")),
                DropdownMenuItem(
                  value: "Electronics",
                  child: Text("Electronics"),
                ),
                DropdownMenuItem(
                  value: "Supermarket purchases",
                  child: Text("Supermarket purchases"),
                ),
                DropdownMenuItem(
                  value: "Installments",
                  child: Text("Installments"),
                ),
                DropdownMenuItem(
                  value: "Monthly income",
                  child: Text("Monthly income"),
                ),
                DropdownMenuItem(
                  value: "Extra Work",
                  child: Text("Extra Work"),
                ),
                DropdownMenuItem(
                  value: "Restaurant lunch",
                  child: Text("Restaurant lunch"),
                ),
                DropdownMenuItem(value: "Car fuel", child: Text("Car fuel")),
              ],
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
            ),

            SizedBox(height: height * 0.025),

            // 4. Description
            TextField(
              controller: descriptionController,
              maxLines: 2,
              decoration: InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            SizedBox(height: height * 0.025),

            // 5. Date
            InkWell(
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                  initialDate: DateTime.now(),
                );
                if (picked != null) {
                  setState(() {
                    selectedDate = picked;
                  });
                }
              },
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: "Date",
                  suffixIcon: const Icon(Icons.calendar_month_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  selectedDate == null
                      ? "Select date"
                      : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                ),
              ),
            ),

            SizedBox(height: height * 0.025),

            // 6. Repetition
            DropdownButtonFormField<String>(
              initialValue: selectedRepetition,
              dropdownColor: kPrimaryColor,
              items: const [
                DropdownMenuItem(value: "One time", child: Text("One time")),
                DropdownMenuItem(value: "Weekly", child: Text("Weekly")),
                DropdownMenuItem(value: "Monthly", child: Text("Monthly")),
              ],
              onChanged: (value) {
                setState(() {
                  selectedRepetition = value!;
                });
              },
            ),

            SizedBox(height: height * 0.04),

            // 7. Save & Cancel Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: transactionType == 'income'
                          ? const Color(0xff0F3A1B)
                          : const Color(0xff5A1012),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => context.go(AppRoutes.kHomeView),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E1E1E),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
