import 'package:bloc/bloc.dart';
import 'appevents.dart';
import 'appstates.dart';
import 'package:platform_design/models/news.dart';
import 'package:platform_design/apis/newsdataprovider.dart';

class NewsBloc extends Bloc<AppGenericEvent, NewsState> {
  final NewsDataProvider newsDataProvider = NewsDataProvider();

  NewsBloc() : super(NewsState()); 
  
  //@override
  //NewsState get initialState => NewsState();

  @override
  Stream<NewsState> mapEventToState(
    AppGenericEvent event,
  ) async* {
    if (event is LoadNewsEvent) {
      try {
        final List<News> newsList = await newsDataProvider.getNewsData();
        yield SuccessfulNewsState(newsList);
      } catch (e) {
        yield FailureNewsState(e.toString());
      }
    }
  }
}
