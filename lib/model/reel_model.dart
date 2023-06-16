class Reels {
  int? total;
  int? totalHits;
  List<Hits>? hits;

  Reels({this.total, this.totalHits, this.hits});

  Reels.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalHits = json['totalHits'];
    if (json['hits'] != null) {
      hits = <Hits>[];
      json['hits'].forEach((v) {
        hits!.add(new Hits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['totalHits'] = this.totalHits;
    if (this.hits != null) {
      data['hits'] = this.hits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hits {
  int? id;
  String? pageURL;
  String? type;
  String? tags;
  int? duration;
  String? pictureId;
  Videos? videos;
  int? views;
  int? downloads;
  int? likes;
  int? comments;
  int? userId;
  String? user;
  String? userImageURL;

  Hits(
      {this.id,
      this.pageURL,
      this.type,
      this.tags,
      this.duration,
      this.pictureId,
      this.videos,
      this.views,
      this.downloads,
      this.likes,
      this.comments,
      this.userId,
      this.user,
      this.userImageURL});

  Hits.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageURL = json['pageURL'];
    type = json['type'];
    tags = json['tags'];
    duration = json['duration'];
    pictureId = json['picture_id'];
    videos =
        json['videos'] != null ? new Videos.fromJson(json['videos']) : null;
    views = json['views'];
    downloads = json['downloads'];
    likes = json['likes'];
    comments = json['comments'];
    userId = json['user_id'];
    user = json['user'];
    userImageURL = json['userImageURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pageURL'] = this.pageURL;
    data['type'] = this.type;
    data['tags'] = this.tags;
    data['duration'] = this.duration;
    data['picture_id'] = this.pictureId;
    if (this.videos != null) {
      data['videos'] = this.videos!.toJson();
    }
    data['views'] = this.views;
    data['downloads'] = this.downloads;
    data['likes'] = this.likes;
    data['comments'] = this.comments;
    data['user_id'] = this.userId;
    data['user'] = this.user;
    data['userImageURL'] = this.userImageURL;
    return data;
  }
}

class Videos {
  Large? large;
  Large? medium;
  Large? small;
  Large? tiny;

  Videos({this.large, this.medium, this.small, this.tiny});

  Videos.fromJson(Map<String, dynamic> json) {
    large = json['large'] != null ? new Large.fromJson(json['large']) : null;
    medium = json['medium'] != null ? new Large.fromJson(json['medium']) : null;
    small = json['small'] != null ? new Large.fromJson(json['small']) : null;
    tiny = json['tiny'] != null ? new Large.fromJson(json['tiny']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.large != null) {
      data['large'] = this.large!.toJson();
    }
    if (this.medium != null) {
      data['medium'] = this.medium!.toJson();
    }
    if (this.small != null) {
      data['small'] = this.small!.toJson();
    }
    if (this.tiny != null) {
      data['tiny'] = this.tiny!.toJson();
    }
    return data;
  }
}

class Large {
  String? url;
  int? width;
  int? height;
  int? size;

  Large({this.url, this.width, this.height, this.size});

  Large.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    width = json['width'];
    height = json['height'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['width'] = this.width;
    data['height'] = this.height;
    data['size'] = this.size;
    return data;
  }
}