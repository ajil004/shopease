import 'package:flutter/material.dart';
import 'package:shopease/images/image.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(

      child: SingleChildScrollView(

        padding: EdgeInsets.all(15),

        child: Column(
          children: [

            SizedBox(height: 10),

            // Profile
            Row(
              children: [

                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.grey.shade200,

                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.black12,
                    backgroundImage: AssetImage(AppImage.settingprofile),
                  ),
                ),

                SizedBox(width: 15),

                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Text(
                      "Vishal V S",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "vishalvs@gmail.com",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                Spacer(),

                Icon(
                  Icons.settings_outlined,
                ),
              ],
            ),

            SizedBox(height: 25),

            // Menu
            Container(

              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade200,
                ),
                borderRadius: BorderRadius.circular(12),
              ),

              child: Column(
                children: [

                  profileItem(
                    Icons.shopping_bag_outlined,
                    "My Orders",
                  ),

                  profileItem(
                    Icons.location_on_outlined,
                    "Addresses",
                  ),

                  profileItem(
                    Icons.credit_card_outlined,
                    "Payment Methods",
                  ),

                  profileItem(
                    Icons.favorite_border,
                    "Wishlist",
                  ),

                  profileItem(
                    Icons.notifications_none,
                    "Notifications",
                  ),

                  profileItem(
                    Icons.help_outline,
                    "Help & Support",
                  ),

                  profileItem(
                    Icons.info_outline,
                    "About Us",
                  ),
                ],
              ),
            ),

            SizedBox(height: 15),

            // Logout
            InkWell(
              onTap: () {

                Navigator.pushAndRemoveUntil(
                  context,

                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),

                  (route) => false,
                );
              },

              child: Container(
                padding: EdgeInsets.all(15),

                child: Row(
                  children: [

                    Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),

                    SizedBox(width: 15),

                    Text(
                      "Log Out",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget profileItem(
    IconData icon,
    String title,
  ) {

    return Container(

      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 16,
      ),

      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),

      child: Row(
        children: [

          Icon(
            icon,
            color: Colors.grey.shade700,
          ),

          SizedBox(width: 15),

          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),

          Icon(
            Icons.chevron_right,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}