import 'package:auto_route/auto_route_annotations.dart';
import 'package:taskbuddies/ui/views/home/home_view.dart';
import 'package:taskbuddies/ui/views/login/login_view.dart';
import 'package:taskbuddies/ui/views/signup/signup_view.dart';
import 'package:taskbuddies/ui/views/startup/startup_view.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: LoginView, initial: false),
  MaterialRoute(page: HomeView, initial: false),
  MaterialRoute(page: StartUpView, initial: true),
  MaterialRoute(page: SignupView, initial: false),
])
class $Router {}

//flutter pub run build_runner build --delete-conflicting-outputs
