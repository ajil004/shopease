import 'package:flutter/material.dart';
import 'package:shopease/images/image.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  final List<Map<String, dynamic>> categories = [
    {
      "name": "Electronics",
      "description": "Phones, Laptops, Accessories",
      "image": AppImage.phonescategory,
    },
    {
      "name": "Fashion",
      "description": "Men, Women, Kids",
      "image": AppImage.sneakerhome,
    },
    {
      "name": "Home & Living",
      "description": "Furniture, Decor, Kitchen",
      "image": AppImage.headphones,
    },
    {
      "name": "Beauty & Personal Care",
      "description": "Skincare, Makeup, Haircare",
      "image": AppImage.homepagebeauty,
    },
    {
      "name": "Sports & Outdoors",
      "description": "Fitness, Travel, Sports Gear",
      "image": AppImage.sportscategory,
    },
    {
      "name": "Books & Stationery",
      "description": "Books, Office, School",
      "image": AppImage.bookcat,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Categories",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 15),

            TextField(
              decoration: InputDecoration(
                hintText: "Search categories...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
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
                        // CATEGORY IMAGE
                        Container(
                          height: 60,
                          width: 60,

                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),

                            child: Image.asset(
                              categories[index]["image"],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        SizedBox(width: 15),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [
                              Text(
                                categories[index]["name"],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),

                              SizedBox(height: 5),

                              Text(
                                categories[index]["description"],
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}