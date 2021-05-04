import 'dart:async';
import 'dart:convert';
import 'package:finddev/data/jobList/remote/response/response.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

import 'jobsApi.dart';

part 'jobs.g.dart';

enum JobsType { list }

class Jobs = _Jobs with _$Jobs;

abstract class _Jobs with Store {
  final api = JobsApi();

  @observable
  ObservableFuture<JobListResponse>? listJobsFuture;

  @action
  Future fetchLatest() => listJobsFuture = ObservableFuture(api.fetchJobs());
}
