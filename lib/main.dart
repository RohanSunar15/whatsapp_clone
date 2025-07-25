import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:whatsapp_clone/core/theme/app_theme.dart';
import 'package:whatsapp_clone/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:whatsapp_clone/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:whatsapp_clone/features/chatList/data/repositories/chatlist_repository_impl.dart';
import 'package:whatsapp_clone/features/chatList/presentation/bloc/chat_list_bloc.dart';
import 'package:whatsapp_clone/features/chatList/presentation/bloc/custom_bottom_nav_bar_cubit.dart';
import 'package:whatsapp_clone/features/splash/presentation/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Hive.initFlutter();
  await Hive.openBox('authBox');
  await Firebase.initializeApp();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc(AuthRepositoryImpl())),
        BlocProvider(create: (_) => ChatListBloc(ChatListRepositoryImpl())),
        BlocProvider<CustomBottomNavBarCubit>(
          create: (_) => CustomBottomNavBarCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
