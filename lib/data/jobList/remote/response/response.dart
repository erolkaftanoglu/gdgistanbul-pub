class JobListResponse {
  List<JobList>? jobList;

  JobListResponse({this.jobList});

  JobListResponse.fromJson(Map<String, dynamic> json) {
    if (json['jobList'] != null) {
      jobList = [];
      json['jobList'].forEach((v) {
        jobList!.add(new JobList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jobList != null) {
      data['jobList'] = this.jobList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class JobList {
  String? position;
  String? jobDescription;
  String? location;
  String? createdAt;
  String? jobType;
  String? link;
  String? company;
  String? email;
  String? contact;
  String? isRemoteAvailable;

  JobList(
      {this.position,
      this.jobDescription,
      this.location,
      this.createdAt,
      this.jobType,
      this.link,
      this.company,
      this.email,
      this.contact,
      this.isRemoteAvailable});

  JobList.fromJson(Map<String, dynamic> json) {
    position = json['position'];
    jobDescription = json['jobDescription'];
    location = json['location'];
    createdAt = json['createdAt'];
    jobType = json['jobType'];
    link = json['link'];
    company = json['company'];
    email = json['email'];
    contact = json['contact'];
    isRemoteAvailable = json['isRemoteAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['position'] = this.position;
    data['jobDescription'] = this.jobDescription;
    data['location'] = this.location;
    data['createdAt'] = this.createdAt;
    data['jobType'] = this.jobType;
    data['link'] = this.link;
    data['company'] = this.company;
    data['email'] = this.email;
    data['contact'] = this.contact;
    data['isRemoteAvailable'] = this.isRemoteAvailable;
    return data;
  }
}
