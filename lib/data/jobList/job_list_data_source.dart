import 'remote/response/response.dart';

abstract class JobListDataSource {
  Future<JobListResponse> getListJobs();
}
