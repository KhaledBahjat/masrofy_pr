import 'package:material_ui/material_ui.dart';
import 'package:masrofy/core/constants.dart';

class BudgetWidget extends StatelessWidget {
  const BudgetWidget({
    super.key,
    required this.height,
    required this.width,
    required this.date,
    required this.amount,
    required this.title,
    required this.place,
    required this.icon,
    required this.type,
  });

  final double width;
  final double height;

  final String date;
  final String amount;
  final String title;
  final String place;
  final String type;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.001),
      child: Container(
        padding: EdgeInsets.all(width * 0.04),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(16),
          border: const Border(
            bottom: BorderSide(
              width: 1.5,
              color: Colors.grey,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // DATE
            Text(
              date,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: width * 0.032,
              ),
            ),
      
            SizedBox(height: height * 0.008),
      
            // TRANSACTION DETAILS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // CATEGORY ICON
                      Container(
                        width: width * 0.12,
                        height: width * 0.12,
                        decoration: BoxDecoration(
                          color: type == 'income'
                              ? const Color(0xff0F3A1B)
                              : const Color(0xff5A1012),
                          border: Border.all(
                            color: type == 'income'
                                ? const Color.fromARGB(
                                    255,
                                    39,
                                    135,
                                    66,
                                  )
                                : Colors.redAccent,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image.asset(
                          icon,
                          width: 20,
                          height: 20,
                        ),
                      ),
      
                      SizedBox(width: width * 0.04),
      
                      // TITLE & DESCRIPTION
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
      
                            Text(
                              place,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: width * 0.032,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
      
                const SizedBox(width: 8),
      
                // AMOUNT
                Text(
                  amount,
                  style: TextStyle(
                    color: type == 'expense'
                        ? Colors.redAccent
                        : const Color.fromARGB(
                            255,
                            39,
                            135,
                            66,
                          ),
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.04,
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