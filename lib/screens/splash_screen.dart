import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_constants.dart';
import '../provider/auth_provider.dart';
import '../provider/category_provider.dart';
import '../provider/todo_provider.dart';
import 'category_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
    final todoProvider = Provider.of<TodoProvider>(context, listen: false);

    try {
      // Load data
      await Future.wait([
        authProvider.checkAuthStatus(),
        categoryProvider.loadCategories(),
        todoProvider.loadTodos(),
      ]);
    } catch (e) {
      // Handle initialization errors gracefully
      print('Error initializing app: $e');
    }

    if (!mounted) return;

    // Add a small delay to ensure splash screen visibility
    await Future.delayed(const Duration(seconds: AppConstants.splashDuration));

    if (!mounted) return;

    // Navigate based on auth status
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => authProvider.isAuthenticated
            ? const CategoriesScreen()
            : const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppConstants.appName,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
