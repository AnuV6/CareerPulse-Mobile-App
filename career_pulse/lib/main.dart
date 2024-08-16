// main.dart

import 'package:career_pulse/pages/interested_area_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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
import 'package:career_pulse/pages/loadingScreen.dart';
import 'package:provider/provider.dart';
import 'package:career_pulse/saved_internships_state.dart';
import 'package:career_pulse/home/home_page.dart';
import 'package:career_pulse/home/resume_suggestions_page.dart';
import 'package:career_pulse/home/internship_details_page.dart';
import 'package:career_pulse/home/resume_report.dart';
import 'package:career_pulse/home/existing_skills.dart';
import 'package:career_pulse/home/new_skills.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';
import 'package:career_pulse/pages/start.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  bool? onboardingCompleted = prefs.getBool('onboarding_completed') ?? false;

  runApp(MainApp(onboardingCompleted: onboardingCompleted));
}

class MainApp extends StatelessWidget {
  final bool onboardingCompleted;

  const MainApp({super.key, required this.onboardingCompleted});

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
        initialRoute: onboardingCompleted ? '/home' : '/start',
        routes: {
          '/': (context) => const SplashScreen(),
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
          '/existingSkills': (context) => const ExistingSkillsPage(),
          '/newSkills': (context) => const NewSkillsPage(),
          '/testPages': (context) => const TestPagesScreen(),
          '/password': (context) => const PasswordScreen(),
          '/pleaseWaitAnalyzing': (context) =>
              const PleaseWaitAnalyzingSplash(),
          '/loadingScreen': (context) => const loadingScreen(),
        },
        onGenerateRoute: (settings) {
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
