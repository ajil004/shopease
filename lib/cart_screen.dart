import 'package:flutter/material.dart';
import 'package:shopease/images/image.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> products = [
    {
      "name": "Wireless Headphones",
      "price": 49.99,
      "quantity": 1,
      "image": "assets/headphone.jpg",
    },
    {
      "name": "Smart Watch",
      "price": 79.99,
      "quantity": 1,
      "image": AppImage.phonescategory,
    },
    {
      "name": "Sneakers",
      "price": 59.99,
      "quantity": 1,
      "image": AppImage.sneakerhome,
    },
  ];

  double getSubtotal() {
    double total = 0;

    for (var product in products) {
      total += product["price"] * product["quantity"];
    }

    return total;
  }

  void increaseQuantity(int index) {
    setState(() {
      products[index]["quantity"]++;
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (products[index]["quantity"] > 1) {
        products[index]["quantity"]--;
      }
    });
  }

  void deleteProduct(int index) {
    setState(() {
      products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    double subtotal = getSubtotal();

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Text(
                  "My Cart",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Spacer(),

                Icon(
                  Icons.delete_outline,
                  color: Colors.grey,
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade200,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: Row(
                    children: [
                      // PRODUCT IMAGE
                      Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),

                          child: Image.asset(
                            products[index]["image"],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              products[index]["name"],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              "\$${products[index]["price"]}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 8),

                            Row(
                              children: [
                                quantityButton(
                                  Icons.remove,
                                  () {
                                    decreaseQuantity(index);
                                  },
                                ),

                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  child: Text(
                                    "${products[index]["quantity"]}",
                                  ),
                                ),

                                quantityButton(
                                  Icons.add,
                                  () {
                                    increaseQuantity(index);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          deleteProduct(index);
                        },

                        icon: Icon(
                          Icons.delete_outline,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // BOTTOM PRICE SECTION
          Container(
            padding: EdgeInsets.all(15),

            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey.shade200,
                ),
              ),
            ),

            child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Subtotal"),

                    Text(
                      "\$${subtotal.toStringAsFixed(2)}",
                    ),
                  ],
                ),

                SizedBox(height: 8),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Shipping"),

                    Text("\$0.00"),
                  ],
                ),

                SizedBox(height: 8),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    Text(
                      "\$${subtotal.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 12),

                SizedBox(
                  width: double.infinity,
                  height: 50,

                  child: ElevatedButton(
                    onPressed: () {},

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff159447),

                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                    ),

                    child: Text(
                      "Proceed to Checkout",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget quantityButton(
    IconData icon,
    VoidCallback function,
  ) {
    return InkWell(
      onTap: function,

      child: Container(
        height: 28,
        width: 28,

        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(7),
        ),

        child: Icon(
          icon,
          size: 16,
        ),
      ),
    );
  }
}