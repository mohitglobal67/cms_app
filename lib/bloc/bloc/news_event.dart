part of 'news_bloc.dart';

class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class GetBreakingNews extends NewsEvent {}

class GetBannersgNews extends NewsEvent {}

class GetTrandingNews extends NewsEvent {}

class GetCatagoryNews extends NewsEvent {}
