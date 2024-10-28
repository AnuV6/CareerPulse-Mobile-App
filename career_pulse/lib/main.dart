// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, unused_import

import 'package:career_pulse/pages/interested_area_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:career_pulse/stuffs/colors.dart';
import 'package:career_pulse/pages/login.dart';
import 'package:career_pulse/pages/register.dart';
import 'package:career_pulse/pages/forgot_pw.dart';
import 'package:career_pulse/pages/splash_screen.dart';
import 'package:career_pulse/pages/home.dart';
import 'package:career_pulse/pages/upload_resume.dart';
import 'package:career_pulse/pages/almost_done_splash.dart';
import 'package:career_pulse/pages/aboutUs.dart';
import 'package:career_pulse/pages/test_pages.dart';
import 'package:career_pulse/pages/password.dart';
import 'package:career_pulse/pages/PleaseWaitAnalyzing_splash.dart';
import 'package:provider/provider.dart';
import 'package:career_pulse/saved_internships_state.dart';
import 'package:career_pulse/home/home_page.dart';
import 'package:career_pulse/home/resume_suggestions_page.dart';
import 'package:career_pulse/home/internship_details_page.dart';
import 'package:career_pulse/home/resume_report.dart';
import 'package:career_pulse/home/existing_skills.dart';
import 'package:career_pulse/home/new_skills.dart';
import 'package:career_pulse/pages/start.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Ensuring that plugin services are initialized before Firebase initialization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase

  runApp(const MainApp()); // Running the main app
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SavedInternshipsState(),
      child: MaterialApp(
        title: 'Career Pulse App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: AppColors.secondaryColor,
          appBarTheme: const AppBarTheme(
            color: AppColors.primaryColor,
            titleTextStyle: TextStyle(
              color: AppColors.titleColor,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonColor,
            ),
          ),
        ),
        home:
            const SplashWrapper(), // The initial screen that shows up when the app is opened
        routes: {
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/forgotPassword': (context) => const ForgotPasswordScreen(),
          '/home': (context) => const HomeScreen(),
          '/uploadResume': (context) => const UploadResumeScreen(),
          '/almostDone': (context) => const AlmostDoneScreen(),
          '/aboutUs': (context) => const AboutUsPage(),
          '/interestedArea': (context) => const InterestedAreaScreen(),
          '/homePage': (context) => const HomePage(),
          '/start': (context) => const StartScreen(),
          '/resumeSuggestions': (context) => const ResumeSuggestionsPage(),
          '/resumeReport': (context) => const ResumeReportPage(),
          '/existingSkills': (context) => const CoursesPage(),
          '/newSkills': (context) => const CoursesPage_1(),
          '/testPages': (context) => const TestPagesScreen(),
          '/password': (context) => const PasswordScreen(),
          '/pleaseWaitAnalyzing': (context) =>
              const PleaseWaitAnalyzingSplash(),
        },
        onGenerateRoute: (settings) {
          // Generate route for internship details with arguments
          if (settings.name == '/internshipDetails') {
            final args = settings.arguments as Map<String, String>;
            return MaterialPageRoute(
              builder: (context) {
                return InternshipDetailsPage(
                  title: args['title']!,
                  company: args['company']!,
                  role: args['role']!,
                );
              },
            );
          }
          return null;
        },
      ),
    );
  }
}

class SplashWrapper extends StatelessWidget {
  const SplashWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      // Check the login state on app start
      future: _checkLoginState(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen(); // Show splash screen while checking login state
        } else {
          // Decide the next screen based on login status
          if (snapshot.data == true) {
            return const HomePage(); // If remembered, navigate to home page
          } else {
            return const LoginScreen(); // Otherwise, navigate to login screen
          }
        }
      },
    );
  }

  // Async function to check the user's login state
  Future<bool> _checkLoginState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('rememberMe') ?? false;
  }
}
