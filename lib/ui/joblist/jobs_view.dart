import 'package:finddev/stores/jobs.dart';
import 'package:finddev/data/jobList/job_list_repository.dart';
import 'package:finddev/data/jobList/remote/response/response.dart';
import 'package:finddev/ui/shared/components/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobx/mobx.dart';

class JobsListView extends StatefulWidget {
  const JobsListView({Key? key}) : super(key: key);

  @override
  _JobsListViewState createState() => _JobsListViewState();
}

class _JobsListViewState extends State<JobsListView>
    with SingleTickerProviderStateMixin {
  final jobsStore = Jobs();

  @override
  void initState() {
    jobsStore.fetchLatest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello GDG Istanbul"),
      ),
      body: SafeArea(child: JobListItemWidget(jobsStore)),
    );
  }
}

class JobListItemWidget extends StatelessWidget {
  final Jobs store;

  const JobListItemWidget(this.store, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Observer(
      builder: (context) {
        final ObservableFuture<JobListResponse>? future = store.listJobsFuture;
        if (future == null) {
          return Center(child: const CircularProgressIndicator());
        }
        switch (future.status) {
          case FutureStatus.pending:
            return Center(child: CircularProgressIndicator());

          case FutureStatus.rejected:
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Failed to load items.',
                  style: TextStyle(color: Colors.red),
                ),
                ElevatedButton(
                  child: const Text('Tap to try again'),
                  onPressed: store.fetchLatest,
                )
              ],
            );

          case FutureStatus.fulfilled:
            final List<JobList> items = future.result.jobList;
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 25),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Menu side"),
                        Text("Create Alert side"),
                        Text("Jobs List side"),
                        Text("Experience level side"),
                        Text("Job type side"),
                        Text("Location"),
                      ],
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: size.height,
                            child: RefreshIndicator(
                              onRefresh: store.fetchLatest,
                              child: ListView.builder(
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemCount: items.length,
                                  itemBuilder: (_, index) {
                                    final item = items[index];
                                    return buildPostOrder(item);
                                  }),
                            ),
                          ),
                        )
                      ],
                    ),
                    flex: 3,
                  ),
                ],
              ),
            );
          // return Container(
          //   child: RefreshIndicator(
          //     onRefresh: store.fetchLatest,
          //     child: ListView.builder(
          //         physics: const AlwaysScrollableScrollPhysics(),
          //         itemCount: items.length,
          //         itemBuilder: (_, index) {
          //           final item = items[index];
          //           return buildPostOrder(item);
          //         }),
          //   ),
          // );
        }
      },
    );
  }

  Widget buildPostOrder(JobList jobList) {
    return Card(
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "${jobList.position}",
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ),
                Text(
                  "${jobList.jobType}",
                ),
              ],
            ),
            Text("${jobList.location}"),
            Text("${jobList.company}"),
            Text("${jobList.createdAt}"),
            Text(
              "${jobList.jobDescription}",
              style: TextStyle(fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
