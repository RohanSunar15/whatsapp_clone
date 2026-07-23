import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:whatsapp_clone/core/services/notification_service.dart';
import 'package:whatsapp_clone/core/theme/app_theme.dart';
import 'package:whatsapp_clone/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:whatsapp_clone/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:whatsapp_clone/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:whatsapp_clone/features/chat/presentation/bloc/chat_bloc.dart';
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

  // Register the background message handler before any other FCM calls.
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  // Initialize FCM: request permission, save token, wire up handlers.
  await NotificationService.initialize();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc(AuthRepositoryImpl())),
        BlocProvider(create: (_) => ChatListBloc(ChatListRepositoryImpl())),
        BlocProvider(create: (_) => CustomBottomNavBarCubit()),
        BlocProvider(create: (_) => ChatBloc(ChatRepositoryImpl())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      // The global navigator key lets NotificationService push routes
      // without needing a BuildContext.
      navigatorKey: NotificationService.navigatorKey,
      home: const SplashScreen(),
    );
  }
}
