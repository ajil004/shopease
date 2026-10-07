import 'package:flutter/material.dart';
import 'package:shopease/colors/colors.dart';
import 'register_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool hidePassword = true;
  bool rememberMe = true;

  void login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(25),

            child: Form(
              key: _formKey,

              child: Column(
                children: [
                  SizedBox(height: 35),

                  // Logo
                  Container(
                    height: 80,
                    width: 80,

                    decoration: BoxDecoration(
                      color: Color(0xff159447),
                      borderRadius: BorderRadius.circular(18),
                    ),

                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                      size: 52,
                    ),
                  ),

                  SizedBox(height: 15),

                  // ShopEase
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Shop",
                          style: TextStyle(
                            color: Color(0xff07182E),
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        TextSpan(
                          text: "Ease",
                          style: TextStyle(
                            color: AppColors.appgreencolor,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30),

                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Login to your account and continue\nshopping",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),

                  SizedBox(height: 30),

                  // ================= EMAIL =================

                  TextFormField(
                    controller: emailController,

                    keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                      hintText: "Email or Phone Number",

                      prefixIcon: Icon(
                        Icons.email_outlined,
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),

                      // Validation message appears here
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),

                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: AppColors.appredcolor,
                          width: 2,
                        ),
                      ),
                    ),

                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your email";
                      }

                      if (!value.contains("@")) {
                        return "Please enter a valid email";
                      }

                      return null;
                    },
                  ),

                  SizedBox(height: 18),

                  // ================= PASSWORD =================

                  TextFormField(
                    controller: passwordController,

                    obscureText: hidePassword,

                    decoration: InputDecoration(
                      hintText: "Password",

                      prefixIcon: Icon(
                        Icons.lock_outline,
                      ),

                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },

                        icon: Icon(
                          hidePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),

                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: AppColors.appredcolor,
                        ),
                      ),

                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: AppColors.appredcolor,
                          width: 2,
                        ),
                      ),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      }

                      if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }

                      return null;
                    },
                  ),

                  SizedBox(height: 5),

                  // ================= REMEMBER ME =================

                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe,

                        activeColor: Color(0xff159447),

                        onChanged: (value) {
                          setState(() {
                            rememberMe = value!;
                          });
                        },
                      ),

                      Text(
                        "Remember me",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Spacer(),

                      Text(
                        "Forgot password?",
                        style: TextStyle(
                          color:AppColors.appgreencolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  // =LOGIN BUTTON 

                  SizedBox(
                    width: double.infinity,
                    height: 55,

                    child: ElevatedButton(
                      onPressed: login,

                      style: ElevatedButton.styleFrom(
                        backgroundColor:AppColors.appgreencolor,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),

                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // = OR

                  Row(
                    children: [
                      Expanded(
                        child: Divider(),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),

                        child: Text(
                          "OR",
                          style: TextStyle(
                            color: AppColors.appgreycolor,
                          ),
                        ),
                      ),

                      Expanded(
                        child: Divider(),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  //  GOOGLE 

                  SizedBox(
                    width: double.infinity,
                    height: 55,

                    child: OutlinedButton(
                      onPressed: () {},

                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),

                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center,

                        children: [
                          Text(
                            "G",
                            style: TextStyle(
                              color: AppColors.appbluecolor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(width: 10),

                          Text(
                            "Continue with Google",
                            style: TextStyle(
                              color: AppColors.appblack87ecolor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  // ================= REGISTER =================

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,

                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          color: AppColors.appgreycolor,
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RegisterScreen(),
                            ),
                          );
                        },

                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: AppColors.appgreencolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}