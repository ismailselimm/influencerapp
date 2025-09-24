import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../presentation/screens/auth/login_screen.dart';
import '../presentation/screens/auth/register_screen.dart';
import '../application/providers/auth_provider.dart';
import '../presentation/screens/main_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      // 🔐 Auth routes
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

      // 🔥 Main app with bottom nav
      GoRoute(
        path: '/',
        name: 'main',
        builder: (context, state) => const MainScreen(),
      ),
    ],

    // 🚦 Redirect logic
    redirect: (context, state) {
      final authState = ref.read(authStateProvider);

      // Loading state'de redirect yapma
      if (authState.isLoading) {
        return null;
      }

      final isLoggedIn = authState.hasValue && authState.value != null;
      final isOnAuthRoute =
          state.fullPath == '/login' || state.fullPath == '/register';

      // ✅ Logged in → login/register'e gitmeye çalışma
      if (isLoggedIn && isOnAuthRoute) {
        return '/';
      }

      // ❌ Not logged in → auth dışı sayfalara gitmeye çalışma
      if (!isLoggedIn && !isOnAuthRoute) {
        return '/login';
      }

      return null; // No redirect
    },

    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.error}'),
      ),
    ),
  );
});
