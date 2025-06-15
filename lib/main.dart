import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/theme/app_theme.dart';
import 'package:whatsapp_clone/features/auth/repository/auth_repository.dart';
import 'package:whatsapp_clone/features/auth/bloc/auth_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/features/chatList/bloc/chat_list_bloc.dart';
import 'package:whatsapp_clone/features/chatList/bloc/custom_bottom_nav_bar_cubit.dart';
import 'package:whatsapp_clone/features/splash/view/splash_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(

    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(AuthRepository()),
        ),
        BlocProvider(
          create: (_) => ChatListBloc(),
        ),
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
