part of 'news_bloc.dart';

enum Condation { loading, sucess, failuar }

class NewsState extends Equatable {
  final String message;
  final Condation condation;

  List<Category>? categories;
  List<Banner>? banners;
  List<Banner>? trendingNews;
  List<Banner>? breakingNews;
  NewsState({
    this.message = '',
    this.condation = Condation.loading,
    this.banners = const <Banner>[],
    this.categories = const <Category>[],
    this.trendingNews = const <Banner>[],
    this.breakingNews = const <Banner>[],
  });

  NewsState copyWith({
    Condation? condation,
    String? message,
    List<Category>? categories,
    List<Banner>? banners,
    List<Banner>? trendingNews,
    List<Banner>? breakingNews,
  }) {
    return NewsState(
        message: message ?? this.message,
        condation: condation ?? this.condation,
        banners: banners ?? this.banners,
        categories: categories ?? this.categories,
        trendingNews: trendingNews ?? this.trendingNews,
        breakingNews: breakingNews ?? this.breakingNews);
  }

  @override
  List<dynamic> get props =>
      [message, condation, categories, banners, trendingNews, breakingNews];
}
