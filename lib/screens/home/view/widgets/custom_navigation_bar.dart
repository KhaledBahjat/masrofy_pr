import 'package:material_ui/material_ui.dart';
import 'package:masrofy/core/constants.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: onTap,
            type: BottomNavigationBarType.fixed,
            backgroundColor: kPrimaryColor,
            elevation: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              NavigationItem(Icons.house, currentIndex == 0),
              NavigationItem(
                Icons.show_chart_rounded,
                currentIndex == 1,
              ),
              CenterItem(currentIndex == 2),
              NavigationItem(
                Icons.list_rounded,
                currentIndex == 3,
              ),
              NavigationItem(
                Icons.person,
                currentIndex == 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

BottomNavigationBarItem CenterItem(bool isSelected) {
  return BottomNavigationBarItem(
    icon: Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? kGreyColor : Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        Icons.add,
        color: isSelected ? Colors.black : kGreyColor,
        size: 22,
      ),
    ),
    label: '',
  );
}

BottomNavigationBarItem NavigationItem(
  IconData icon,
  bool isSelected,
) {
  return BottomNavigationBarItem(
    icon: Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? kGreyColor : Colors.transparent,
      ),
      child: Icon(
        icon,
        size: 20,
        color: isSelected ? Colors.black : Colors.grey,
      ),
    ),
    label: '',
  );
}