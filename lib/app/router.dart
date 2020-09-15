import 'package:auto_route/auto_route_annotations.dart';
import 'package:taskbuddies/ui/views/home/home_view.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: HomeView, initial: true),
])
class $Router {}

//flutter pub run build_runner build --delete-conflicting-outputs
