import 'package:catcher/catcher.dart';
import 'package:finddev/ui/joblist/jobs_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'utils/theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  CatcherOptions debugOptions = CatcherOptions(
    DialogReportMode(),
    [ConsoleHandler()],
  );

  CatcherOptions releaseOptions = CatcherOptions(
    PageReportMode(),
    [ConsoleHandler()],
  );

  Catcher(
    runAppFunction: () {
      runApp(MyApp2());
    },
    debugConfig: debugOptions,
    releaseConfig: releaseOptions,
  );
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp(
        title: 'GDG Istanbul Find Dev',
        theme: CustomTheme.lightTheme,
        home: JobsListView(),
      ),
    );
  }
}
