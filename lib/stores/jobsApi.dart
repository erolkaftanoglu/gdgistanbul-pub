import 'dart:convert';

import 'package:finddev/data/jobList/remote/response/response.dart';
import 'package:http/http.dart' as http;

const String url = "https://us-central1-gdgist-jobs.cloudfunctions.net";

enum Type { listJobs, top }

extension on Type {
  Uri get uri {
    switch (this) {
      case Type.listJobs:
        return Uri.parse('$url/listJobs');
      case Type.top:
        return Uri.parse('$url/listJobs');
    }
  }
}

class JobsApi {
  Future<JobListResponse> fetchJobs() async {
    JobListResponse jobListResponse = await _getItem(Type.listJobs);
    return jobListResponse;
  }

  Future<JobListResponse> _getItem(Type type) async {
    final response = await http.get(type.uri);

    if (response.statusCode == 200) {
      return JobListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load JobListResponse');
    }
  }
}
