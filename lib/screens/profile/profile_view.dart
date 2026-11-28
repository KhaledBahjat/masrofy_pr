import 'package:masrofy/screens/profile/about_app.dart';
import 'package:masrofy/screens/profile/assistance.dart';
import 'package:masrofy/screens/profile/rate_app.dart';
import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:masrofy/core/constants.dart';
import 'package:masrofy/core/mock_data.dart';
import 'package:masrofy/core/routes.dart';
import 'package:masrofy/core/utills/custom_app_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    const user = MockData.currentUser;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: CustomAppBar(width: width, text: 'Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.02,
        ),
        child: Column(
          children: [
            // Profile Card
            Container(
              padding: EdgeInsets.all(width * 0.04),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(16),
                border: const Border(
                  right: BorderSide(color: Color(0xff123FB1), width: 5),
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: width * 0.08,
                    backgroundImage: AssetImage(user.avatarAsset),
                  ),
                  SizedBox(width: width * 0.04),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.displayName,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.045,
                          ),
                        ),
                        Text(
                          user.email,
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: width * 0.034,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Profile editing is disabled in UI demo mode',
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit, color: Colors.white),
                  ),
                ],
              ),
            ),

            SizedBox(height: height * 0.03),

            _buildOptionTile(
              icon: Icons.help_outline,
              title: "Assistant and guidance",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AssistanceScreen()),
                );
              },
            ),

            _buildOptionTile(
              icon: Icons.info_outline,
              title: "About the app",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutAppScreen()),
                );
              },
            ),

            _buildOptionTile(
              icon: Icons.star_border,
              title: "Rate the app",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RateAppScreen()),
                );
              },
            ),

            SizedBox(height: height * 0.01),

            // ---------------- LOGOUT ----------------
            _buildOptionTile(
              icon: Icons.logout,
              title: "Log out",
              color: Colors.redAccent,
              iconColor: Colors.redAccent,
              onTap: () {
                GoRouter.of(context).pushReplacement(AppRoutes.kSplashView);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? color,
    Color? iconColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: kDarkGrey,
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          leading: Icon(icon, color: iconColor ?? Colors.white),
          title: Text(
            title,
            style: TextStyle(
              color: color ?? Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 14,
            color: Colors.white,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
