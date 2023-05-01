// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class Upcoming {
  String? page;
  String? next;
  String? entries;
  List<Results>? results;

  Upcoming({this.page, this.next, this.entries, this.results});

  Upcoming.fromJson(Map<String, dynamic> json) {
    page = json['page'].toString();
    next = json['next'].toString();
    entries = json['entries'].toString();
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['next'] = this.next;
    data['entries'] = this.entries;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? id;
  PrimaryImage? primaryImage;
  TitleType? titleType;
  TitleText? titleText;
  ReleaseYear? releaseYear;
  ReleaseDate? releaseDate;

  Results(
      {this.id,
      this.primaryImage,
      this.titleType,
      this.titleText,
      this.releaseYear,
      this.releaseDate});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    primaryImage = json['primaryImage'] != null
        ? new PrimaryImage.fromJson(json['primaryImage'])
        : null;
    titleType = json['titleType'] != null
        ? new TitleType.fromJson(json['titleType'])
        : null;
    titleText = json['titleText'] != null
        ? new TitleText.fromJson(json['titleText'])
        : null;
    releaseYear = json['releaseYear'] != null
        ? new ReleaseYear.fromJson(json['releaseYear'])
        : null;
    releaseDate = json['releaseDate'] != null
        ? new ReleaseDate.fromJson(json['releaseDate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.primaryImage != null) {
      data['primaryImage'] = this.primaryImage!.toJson();
    }
    if (this.titleType != null) {
      data['titleType'] = this.titleType!.toJson();
    }
    if (this.titleText != null) {
      data['titleText'] = this.titleText!.toJson();
    }
    if (this.releaseYear != null) {
      data['releaseYear'] = this.releaseYear!.toJson();
    }
    if (this.releaseDate != null) {
      data['releaseDate'] = this.releaseDate!.toJson();
    }
    return data;
  }
}

class PrimaryImage {
  String? id;
  String? width;
  String? height;
  String? url;
  Caption? caption;
  String? sTypename;

  PrimaryImage(
      {this.id,
      this.width,
      this.height,
      this.url,
      this.caption,
      this.sTypename});

  PrimaryImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    width = json['width'].toString();
    height = json['height'].toString();
    url = json['url'];
    caption =
        json['caption'] != null ? new Caption.fromJson(json['caption']) : null;
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['width'] = this.width;
    data['height'] = this.height;
    data['url'] = this.url;
    if (this.caption != null) {
      data['caption'] = this.caption!.toJson();
    }
    data['__typename'] = this.sTypename;
    return data;
  }
}

class Caption {
  String? plainText;
  String? sTypename;

  Caption({this.plainText, this.sTypename});

  Caption.fromJson(Map<String, dynamic> json) {
    plainText = json['plainText'];
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plainText'] = this.plainText;
    data['__typename'] = this.sTypename;
    return data;
  }
}

class TitleType {
  String? text;
  String? id;
  bool? isSeries;
  bool? isEpisode;
  List<Categories>? categories;
  bool? canHaveEpisodes;
  String? sTypename;
  DisplayableProperty? displayableProperty;

  TitleType(
      {this.text,
      this.id,
      this.isSeries,
      this.isEpisode,
      this.categories,
      this.canHaveEpisodes,
      this.sTypename,
      this.displayableProperty});

  TitleType.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    id = json['id'];
    isSeries = json['isSeries'];
    isEpisode = json['isEpisode'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    canHaveEpisodes = json['canHaveEpisodes'];
    sTypename = json['__typename'];
    displayableProperty = json['displayableProperty'] != null
        ? new DisplayableProperty.fromJson(json['displayableProperty'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['id'] = this.id;
    data['isSeries'] = this.isSeries;
    data['isEpisode'] = this.isEpisode;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    data['canHaveEpisodes'] = this.canHaveEpisodes;
    data['__typename'] = this.sTypename;
    if (this.displayableProperty != null) {
      data['displayableProperty'] = this.displayableProperty!.toJson();
    }
    return data;
  }
}

class Categories {
  String? value;
  String? sTypename;

  Categories({this.value, this.sTypename});

  Categories.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['__typename'] = this.sTypename;
    return data;
  }
}

class DisplayableProperty {
  Caption? value;
  String? sTypename;

  DisplayableProperty({this.value, this.sTypename});

  DisplayableProperty.fromJson(Map<String, dynamic> json) {
    value = json['value'] != null ? new Caption.fromJson(json['value']) : null;
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.value != null) {
      data['value'] = this.value!.toJson();
    }
    data['__typename'] = this.sTypename;
    return data;
  }
}

class TitleText {
  String? text;
  String? sTypename;

  TitleText({this.text, this.sTypename});

  TitleText.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['__typename'] = this.sTypename;
    return data;
  }
}

class ReleaseYear {
  String? year;
  String? endYear;
  String? sTypename;

  ReleaseYear({this.year, this.endYear, this.sTypename});

  ReleaseYear.fromJson(Map<String, dynamic> json) {
    year = json['year'].toString();
    endYear = json['endYear'].toString();
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['endYear'] = this.endYear;
    data['__typename'] = this.sTypename;
    return data;
  }
}

class ReleaseDate {
  String? day;
  String? month;
  String? year;
  String? sTypename;

  ReleaseDate({this.day, this.month, this.year, this.sTypename});

  ReleaseDate.fromJson(Map<String, dynamic> json) {
    day = json['day'].toString();
    month = json['month'].toString();
    year = json['year'].toString();
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['month'] = this.month;
    data['year'] = this.year;
    data['__typename'] = this.sTypename;
    return data;
  }
}