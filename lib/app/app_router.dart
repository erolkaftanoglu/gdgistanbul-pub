import 'package:auto_route/auto_route.dart';
import 'package:finddev/ui/joblist/jobs_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: JobsListView, initial: true),
  ],
)
class $AppRouter {}
