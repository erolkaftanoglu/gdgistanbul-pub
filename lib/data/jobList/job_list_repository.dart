import 'package:finddev/data/jobList/job_list_data_source.dart';
import 'package:finddev/data/jobList/remote/job_list_client.dart';
import 'remote/response/response.dart';

// class JobListRepository extends JobListDataSource {
//   Dio _dio = Dio();
//   late JobListApiClient _apiClient;

//   JobListRepository() {
//     _dio = Dio();
//     _apiClient = JobListApiClient(_dio);
//   }

//   @override
//   Future<JobListResponse> getListJobs() {
//     return _apiClient.getJobList();
//   }
// }
