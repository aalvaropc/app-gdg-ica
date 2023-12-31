class TeamsData {
  List<Team>? teams;

  TeamsData({this.teams});

  TeamsData.fromJson(Map<String, dynamic> json) {
    if (json['teams'] != null) {
      // teams = new List<Team>();
      teams = List<Team>.from(json['teams'].map((v) => Team.fromJson(v)));
      
      // json['teams'].forEach((v) {
      //   teams!.add(Team.fromJson(v));
      // });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.teams != null) {
  //     data['teams'] = this.teams!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'teams': teams!.map((v) => v.toJson()).toList(),
    };
    return data;
  }
}

class Team {
  String? name;
  String? desc;
  String? job;
  String? image;
  String? speciality;
  String? fbUrl;
  String? twitterUrl;
  String? linkedinUrl;
  String? githubUrl;
  String? contribution;

  Team(
      {this.name,
      this.desc,
      this.job,
      this.image,
      this.speciality,
      this.fbUrl,
      this.twitterUrl,
      this.linkedinUrl,
      this.githubUrl,
      this.contribution});

  Team.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    desc = json['desc'];
    job = json['job'];
    image = json['image'];
    speciality = json['speciality'];
    fbUrl = json['fb_url'];
    twitterUrl = json['twitter_url'];
    linkedinUrl = json['linkedin_url'];
    githubUrl = json['github_url'];
    contribution = json['contribution'];
  }

  //removing this
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   data['name'] = name;
  //   data['desc'] = desc;
  //   data['job'] = job;
  //   data['image'] = image;
  //   data['speciality'] = speciality;
  //   data['fb_url'] = fbUrl;
  //   data['twitter_url'] = twitterUrl;
  //   data['linkedin_url'] = linkedinUrl;
  //   data['github_url'] = githubUrl;
  //   data['contribution'] = contribution;
  //   return data;
  // }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'name': name,
      'desc': desc,
      'job': job,
      'image': image,
      'speciality': speciality,
      'fb_url': fbUrl,
      'twitter_url': twitterUrl,
      'linkedin_url': linkedinUrl,
      'github_url': githubUrl,
      'contribution': contribution,
    };
    return data;
  }
}

List<Team> teams = [
  Team(
    name: "Sundar Pichai",
    desc: "Organizer",
    contribution: "Google CEO",
    image:
        "https://pbs.twimg.com/profile_images/864282616597405701/M-FEJMZ0_400x400.jpg",
  ),
  Team(
    name: "Vrijraj",
    desc: "Co-Organizer",
    contribution: "Logistics and travels",
    image: "https://avatars2.githubusercontent.com/u/10599101?s=460&v=4",
  ),
  Team(
    name: "Larry Page",
    desc: "Co-Organizer",
    contribution: "Founder",
    image:
        "https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5c76bcaaa7ea43100043c836%2F400x400.jpg%3Ffit%3Dscale%26background%3D000000",
  ),
  Team(
    name: "Pawan Kumar",
    desc: "Co-Organizer",
    contribution: "Developed the app",
    image:
        "https://avatars1.githubusercontent.com/u/12619420?s=400&u=eac38b075e4e4463edfb0f0a8972825cf7803d4c&v=4",
  ),
  Team(
    name: "Pawan Kumar",
    desc: "Organizer",
    contribution: "Developed the app",
    image:
        "https://avatars1.githubusercontent.com/u/12619420?s=400&u=eac38b075e4e4463edfb0f0a8972825cf7803d4c&v=4",
  ),
];
