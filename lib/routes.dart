import 'package:cginot_app/screens/chats/chats_screen.dart';
import 'package:cginot_app/screens/forum/components/add_comment.dart';
import 'package:cginot_app/screens/forum/components/forum_create.dart';
import 'package:cginot_app/screens/forum/components/forum_detail.dart';
import 'package:cginot_app/screens/forum/forum.dart';
import 'package:cginot_app/screens/login/login_screen.dart';
import 'package:cginot_app/screens/notification/noti_screen.dart';
import 'package:cginot_app/screens/onboard/onboard_screen.dart';
import 'package:cginot_app/screens/profile/profile_screen.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      name: 'Login',
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      name: 'Onboard',
      path: '/',
      builder: (context, state) => OnboardScreen(),
    ),
    GoRoute(
      name: 'Profile',
      path: '/profile',
      builder: (context, state) {
        return ProfileScreen();
      },
    ),
    GoRoute(
      name: 'Notifications',
      path: '/notifications',
      builder: (context, state) {
        return const NotificationsScreen();
      },
    ),
    GoRoute(
      name: 'Chats',
      path: '/chats',
      builder: (context, state) {
        return ChatsScreen();
      },
    ),
    GoRoute(
      name: 'Forum',
      path: '/forum',
      builder: (context, state) {
        return ForumPage();
      },
    ),
    GoRoute(
      name: 'Detail',
      path: '/detail',
      builder: (context, state) {
        final String postID = state.queryParams['postID']!;
        return ForumDetailPage(postID: postID);
      },
    ),
    GoRoute(
      name: 'Createpost',
      path: '/createpost',
      builder: (context, state) {
        return ForumCreateScreen();
      },
    ),
    GoRoute(
      name: 'Comment',
      path: '/Comment',
      builder: (context, state) {
        final String postID = state.queryParams['postID']!;
        return AddCommentScreen(postID: postID);
      },
    )
  ],
);
