import 'package:bloc/bloc.dart';
import 'package:cms_news/model/news/news_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart' as rootBundle;
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsState()) {
    on<GetCatagoryNews>(_getcatagorynews);
    on<GetBannersgNews>(_getbannernews);

    on<GetTrandingNews>(_gettrandingNews);

    on<GetBreakingNews>(_getbreakingNews);
  }

  void _getcatagorynews(GetCatagoryNews event, Emitter<NewsState> emit) async {
    try {
      emit(state.copyWith(
        message: "Sucess",
        condation: Condation.loading,
      ));
      final jsondata = await rootBundle.rootBundle.loadString('json/news.json');
      var data = newsModelFromJson(jsondata);
      emit(state.copyWith(
          message: "Sucess",
          condation: Condation.sucess,
          categories: data.dashboard!.categories));
    } catch (e) {
      emit(state.copyWith(
        message: e.toString(),
        condation: Condation.failuar,
      ));
    }
  }

  void _getbannernews(GetBannersgNews event, Emitter<NewsState> emit) async {
    try {
      emit(state.copyWith(
        message: "Sucess",
        condation: Condation.loading,
      ));
      final jsondata = await rootBundle.rootBundle.loadString('json/news.json');
      var data = newsModelFromJson(jsondata);
      emit(state.copyWith(
          message: "Sucess",
          condation: Condation.sucess,
          banners: data.dashboard!.banners));
    } catch (e) {
      emit(state.copyWith(
        message: e.toString(),
        condation: Condation.failuar,
      ));
    }
  }

  void _gettrandingNews(GetTrandingNews event, Emitter<NewsState> emit) async {
    try {
      emit(state.copyWith(
        message: "Sucess",
        condation: Condation.loading,
      ));
      final jsondata = await rootBundle.rootBundle.loadString('json/news.json');
      var data = newsModelFromJson(jsondata);
      emit(state.copyWith(
          message: "Sucess",
          condation: Condation.sucess,
          trendingNews: data.dashboard!.trendingNews));
    } catch (e) {
      emit(state.copyWith(
        message: e.toString(),
        condation: Condation.failuar,
      ));
    }
  }

  void _getbreakingNews(GetBreakingNews event, Emitter<NewsState> emit) async {
    try {
      emit(state.copyWith(
        message: "Sucess",
        condation: Condation.loading,
      ));
      final jsondata = await rootBundle.rootBundle.loadString('json/news.json');
      var data = newsModelFromJson(jsondata);
      emit(state.copyWith(
          message: "Sucess",
          condation: Condation.sucess,
          breakingNews: data.dashboard!.breakingNews));
    } catch (e) {
      emit(state.copyWith(
        message: e.toString(),
        condation: Condation.failuar,
      ));
    }
  }
}
