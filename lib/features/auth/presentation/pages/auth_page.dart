import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:market_place_app/core/constants/app_constants.dart';
import 'package:market_place_app/core/di/inject_module.dart';
import 'package:market_place_app/core/router/app_router.dart';
import 'package:market_place_app/features/auth/presentation/bloc/auth_bloc.dart';

@RoutePage()
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _bloc = getIt<AuthBloc>();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove(); // Убираем сплеш
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

  void _navigateToHomePage() {
    getIt<AppRouter>().replace(const HomeRoute());
  }

  void _navigateToTalkerScreen() {
    getIt<AppRouter>().push(TalkerRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Authentication',
          style: TextStyle(
            fontSize: AppConstants.appBarTitleSize,
            fontWeight: AppConstants.appBarTitleWeight,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _navigateToTalkerScreen(),
            icon: Icon(Icons.flutter_dash),
          ),
        ],
      ),
      body: BlocConsumer(
        listener: (context, state) {
          if (state is AuthError) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                icon: const Icon(Icons.error, color: Colors.red),
                title: Text(state.toString()),
                content: const Text(
                  'An error occurred while processing the game.',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          }
        },
        bloc: _bloc,
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    AppConstants.appLogo,
                    height: AppConstants.appLogoLargeSize,
                  ),
                ),
                Text(
                  AppConstants.appName,
                  style: TextStyle(
                    fontSize: AppConstants.appNameTextSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _navigateToHomePage();
                  },
                  child: Text('Home'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
