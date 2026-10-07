import 'package:flutter/material.dart';
import 'package:shopease/images/image.dart';

import 'category_screen.dart';
import 'cart_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    HomeContent(),
    CategoryScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,

        selectedItemColor: Color(0xff159447),

        unselectedItemColor: Colors.grey,

        type: BottomNavigationBarType.fixed,

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_outlined),
            activeIcon: Icon(Icons.grid_view),
            label: "Category",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}


// = HOME CONTENT
class HomeContent extends StatelessWidget {
  HomeContent({super.key});

  final List<Map<String, dynamic>> categories = [
    {
      "name": "Electronics",
      "image": AppImage.phonescategory,
    },
    {
      "name": "Fashion",
      "image":  AppImage.sneakerhome,
    },
    {
      "name": "Home & Living",
      "image":  AppImage.homeandlivingfurniture,
    },
    {
      "name": "Beauty",
      "image": AppImage.homepagebeauty,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(15),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // GREETING
            Row(
              children: [
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    Text(
                      "Hello,",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),

                    Text(
                      "Vishal 👋",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                Spacer(),

                IconButton(
                  onPressed: () {},

                  icon: Icon(
                    Icons.notifications_none,
                  ),
                ),
              ],
            ),

            SizedBox(height: 15),

            // SEARCH
            TextField(
              decoration: InputDecoration(
                hintText: "Search for products...",
                prefixIcon: Icon(Icons.search),

                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(15),
                ),
              ),
            ),

            SizedBox(height: 20),

            // BANNER
            Container(
  height: 130,
  width: double.infinity,

  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    image: DecorationImage(
      image: AssetImage("assets/headphoneS.jpg"),
      fit: BoxFit.cover,
    ),
  ),

  child: Container(
    padding: const EdgeInsets.all(12),

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.black.withOpacity(0.25),
    ),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        const Text(
          "Big Deals",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        const Text(
          "Big Smiles",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 4),

        const Text(
          "Up to 50% OFF",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),

        const SizedBox(height: 5),

        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 4,
          ),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),

          child: const Text(
            "Shop Now",
            style: TextStyle(
              color: Color(0xff159447),
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ),
      ],
    ),
  ),
),
           

            SizedBox(height: 20),

            // FEATURES
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

              children: [
                featureItem(
                  Icons.local_shipping_outlined,
                  "Fast\nDelivery",
                ),

                featureItem(
                  Icons.verified_user_outlined,
                  "Secure\nPayment",
                ),

                featureItem(
                  Icons.star_border,
                  "Best\nQuality",
                ),

                featureItem(
                  Icons.headset_mic_outlined,
                  "24/7\nSupport",
                ),
              ],
            ),

            SizedBox(height: 25),

            // TOP CATEGORIES
            Text(
              "Top Categories",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 15),

            SizedBox(
              height: 120,

              child: ListView.builder(
                scrollDirection:
                    Axis.horizontal,

                itemCount: categories.length,

                itemBuilder: (context, index) {
                  return Container(
                    width: 100,

                    margin:
                        EdgeInsets.only(right: 12),

                    decoration: BoxDecoration(
                      color: Color(0xffF5F5F5),
                      borderRadius:
                          BorderRadius.circular(12),
                    ),

                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,

                      children: [
                        // CATEGORY IMAGE
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(10),

                          child: Image.asset(
                            categories[index]["image"],
                            height: 55,
                            width: 55,
                            fit: BoxFit.cover,
                          ),
                        ),

                        SizedBox(height: 8),

                        Text(
                          categories[index]["name"],
                          textAlign:
                              TextAlign.center,

                          style: TextStyle(
                            fontSize: 12,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 20),

            // POPULAR PRODUCTS
            Text(
              "Popular Products",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 15),

            Row(
              children: [
                productCard(
                  "Wireless Headphones",
                  "\$49.99",
                  "assets/headphone.jpg",
                ),

                SizedBox(width: 12),

                productCard(
                  "Smart Watch",
                  "\$79.99",
                  "assets/smart.jpg",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // FEATURE ITEM 
  Widget featureItem(
    IconData icon,
    String text,
  ) {
    return Column(
      children: [
        Container(
          height: 45,
          width: 45,

          decoration: BoxDecoration(
            color: Color(0xffE9F7EE),
            shape: BoxShape.circle,
          ),

          child: Icon(
            icon,
            color: Color(0xff159447),
          ),
        ),

        SizedBox(height: 5),

        Text(
          text,
          textAlign: TextAlign.center,

          style: TextStyle(
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  // PRODUCT CARD 

  Widget productCard(
    String name,
    String price,
    String image,
  ) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),

        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade200,
          ),

          borderRadius:
              BorderRadius.circular(15),
        ),

        child: Column(
          children: [
            // PRODUCT IMAGE
            Container(
              height: 100,
              width: double.infinity,

              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius:
                    BorderRadius.circular(12),
              ),

              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(12),

                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            SizedBox(height: 8),

            Text(
              name,
              maxLines: 1,
              overflow:
                  TextOverflow.ellipsis,

              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 5),

            Text(
              price,
              style: TextStyle(
                color: Color(0xff159447),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}