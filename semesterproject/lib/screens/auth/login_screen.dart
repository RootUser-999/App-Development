import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../onboarding/user_info_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _controller.dispose();
    super.dispose();
  }

  Future<void> _fakeEmailLogin() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (_emailController.text.trim() == 'test@example.com' &&
        _passwordController.text == '123456') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const UserInfoScreen()),
      );
    } else {
      setState(() => _errorMessage = "Invalid email or password.");
    }

    setState(() => _isLoading = false);
  }

  Future<void> _fakeGoogleSignIn() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    await Future.delayed(const Duration(seconds: 2));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const UserInfoScreen()),
    );

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'lib/assets/images/bg1.JPG',
              fit: BoxFit.cover,
            ),
          ),

          // Optional white overlay for readability
          // Positioned.fill(
          //   child: Container(color: Colors.white.withOpacity(0.85)),
          // ),

          // Optional animated layer (can remove if not needed)
          Positioned.fill(
            child: Opacity(
              opacity: 0.07,
              child: Lottie.asset(
                'assets/animations/fitness_bg.json',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Login content
          Center(
            child: FadeTransition(
              opacity: _controller,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Workout Pro',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade800,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Login to start your transformation!',
                      style: TextStyle(fontSize: 16, color: Color.fromARGB(137, 255, 255, 255)),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),

                    // Email field
TextField(
  controller: _emailController,
  keyboardType: TextInputType.emailAddress,
  style: const TextStyle(color: Colors.white),
  decoration: InputDecoration(
    labelText: 'Email',
    labelStyle: const TextStyle(color: Colors.white),
    hintStyle: const TextStyle(color: Colors.white70),
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white54),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(10),
    ),
    prefixIcon: const Icon(Icons.email, color: Colors.white),
  ),
),
const SizedBox(height: 20),

// Password field
TextField(
  controller: _passwordController,
  obscureText: true,
  style: const TextStyle(color: Colors.white),
  decoration: InputDecoration(
    labelText: 'Password',
    labelStyle: const TextStyle(color: Colors.white),
    hintStyle: const TextStyle(color: Colors.white70),
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white54),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(10),
    ),
    prefixIcon: const Icon(Icons.lock, color: Colors.white),
  ),
),

                    // Login Button
                    ElevatedButton(
                      onPressed: _isLoading ? null : _fakeEmailLogin,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 10),

                    // Sign Up Button
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Sign-up screen not implemented."),
                          ),
                        );
                      },
                      child: const Text("Don't have an account? Sign up"),
                    ),
                    const Divider(height: 40),

                    // Google Sign In (simulated)
                    ElevatedButton.icon(
                      icon: Image.asset('lib/assets/images/google.png', height: 24),
                      label: const Text("Continue with Google"),
                      onPressed: _isLoading ? null : _fakeGoogleSignIn,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        minimumSize: const Size(double.infinity, 50),
                        side: const BorderSide(color: Colors.black12),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    if (_errorMessage != null)
                      Text(
                        _errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                  ],
                ),
              ),
            ),
          ),

          // Loading overlay
          if (_isLoading)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.3),
                child: const Center(child: CircularProgressIndicator()),
              ),
            ),
        ],
      ),
    );
  }
}
