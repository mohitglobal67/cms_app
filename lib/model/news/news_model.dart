import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  String? version;
  String? encoding;
  Dashboard? dashboard;

  NewsModel({
    this.version,
    this.encoding,
    this.dashboard,
  });

  NewsModel copyWith({
    String? version,
    String? encoding,
    Dashboard? dashboard,
  }) =>
      NewsModel(
        version: version ?? this.version,
        encoding: encoding ?? this.encoding,
        dashboard: dashboard ?? this.dashboard,
      );

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        version: json["version"],
        encoding: json["encoding"],
        dashboard: json["dashboard"] == null
            ? null
            : Dashboard.fromJson(json["dashboard"]),
      );

  Map<String, dynamic> toJson() => {
        "version": version,
        "encoding": encoding,
        "dashboard": dashboard?.toJson(),
      };
}

class Dashboard {
  List<Category>? categories;
  List<Banner>? banners;
  List<Banner>? trendingNews;
  List<Banner>? breakingNews;

  Dashboard({
    this.categories,
    this.banners,
    this.trendingNews,
    this.breakingNews,
  });

  Dashboard copyWith({
    List<Category>? categories,
    List<Banner>? banners,
    List<Banner>? trendingNews,
    List<Banner>? breakingNews,
  }) =>
      Dashboard(
        categories: categories ?? this.categories,
        banners: banners ?? this.banners,
        trendingNews: trendingNews ?? this.trendingNews,
        breakingNews: breakingNews ?? this.breakingNews,
      );

  factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
        banners: json["banners"] == null
            ? []
            : List<Banner>.from(
                json["banners"]!.map((x) => Banner.fromJson(x))),
        trendingNews: json["trending_news"] == null
            ? []
            : List<Banner>.from(
                json["trending_news"]!.map((x) => Banner.fromJson(x))),
        breakingNews: json["breaking_news"] == null
            ? []
            : List<Banner>.from(
                json["breaking_news"]!.map((x) => Banner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "banners": banners == null
            ? []
            : List<dynamic>.from(banners!.map((x) => x.toJson())),
        "trending_news": trendingNews == null
            ? []
            : List<dynamic>.from(trendingNews!.map((x) => x.toJson())),
        "breaking_news": breakingNews == null
            ? []
            : List<dynamic>.from(breakingNews!.map((x) => x.toJson())),
      };
}

class Banner {
  String? id;
  String? title;
  String? coverImage;
  String? related;
  DateTime? published;
  String? newsViews;
  String? category;
  String? summary;

  Banner({
    this.id,
    this.title,
    this.coverImage,
    this.related,
    this.published,
    this.newsViews,
    this.category,
    this.summary,
  });

  Banner copyWith({
    String? id,
    String? title,
    String? coverImage,
    String? related,
    DateTime? published,
    String? newsViews,
    String? category,
    String? summary,
  }) =>
      Banner(
        id: id ?? this.id,
        title: title ?? this.title,
        coverImage: coverImage ?? this.coverImage,
        related: related ?? this.related,
        published: published ?? this.published,
        newsViews: newsViews ?? this.newsViews,
        category: category ?? this.category,
        summary: summary ?? this.summary,
      );

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["id"],
        title: json["title"],
        coverImage: json["coverImage"],
        related: json["related"],
        published: json["published"] == null
            ? null
            : DateTime.parse(json["published"]),
        newsViews: json["newsViews"],
        category: json["category"],
        summary: json["summary"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "coverImage": coverImage,
        "related": related,
        "published":
            "${published!.year.toString().padLeft(4, '0')}-${published!.month.toString().padLeft(2, '0')}-${published!.day.toString().padLeft(2, '0')}",
        "newsViews": newsViews,
        "category": category,
        "summary": summary,
      };
}

class Category {
  String? catId;
  String? title;
  String? image;
  String? count;

  Category({
    this.catId,
    this.title,
    this.image,
    this.count,
  });

  Category copyWith({
    String? catId,
    String? title,
    String? image,
    String? count,
  }) =>
      Category(
        catId: catId ?? this.catId,
        title: title ?? this.title,
        image: image ?? this.image,
        count: count ?? this.count,
      );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        catId: json["catId"],
        title: json["title"],
        image: json["image"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "catId": catId,
        "title": title,
        "image": image,
        "count": count,
      };
}
