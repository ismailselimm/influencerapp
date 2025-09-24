import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../presentation/screens/auth/login_screen.dart';
import '../presentation/screens/auth/register_screen.dart';
import '../application/providers/auth_provider.dart';
import '../presentation/screens/home/home_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      // Auth routes
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegisterScreen(),
      ),
      
      // App routes
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
    
    // Redirect logic
    redirect: (context, state) {
      final authState = ref.read(authStateProvider);
      final isLoggedIn = authState.hasValue && authState.value != null;
      final isOnAuthRoute = state.fullPath == '/login' || state.fullPath == '/register';
      
      // If logged in and on auth route, redirect to home
      if (isLoggedIn && isOnAuthRoute) {
        return '/home';
      }
      
      // If not logged in and not on auth route, redirect to login
      if (!isLoggedIn && !isOnAuthRoute) {
        return '/login';
      }
      
      return null; // No redirect needed
    },
    
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.error}'),
      ),
    ),
  );
});
