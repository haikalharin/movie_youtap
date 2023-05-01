
import 'package:kiwi/kiwi.dart';

import '../../data/datasource/remote_datasource.dart';

import '../../data/repository/article_repository/article_repository.dart';
import '../../data/repository/article_repository/article_repository_impl.dart';
import '../../pages/list_article_page/bloc/article_bloc.dart';
import '../network/http/http_client.dart';
import '../network/network_info.dart';

part 'injector_config.g.dart';

abstract class InjectorConfig {
  static KiwiContainer? container;

  static void setup() {
    container = KiwiContainer();
    final injector = _$InjectorConfig();
    // ignore: cascade_invocations
    injector._configure();
  }

  // ignore: type_annotate_public_apis
  static final resolve = container!.resolve;

  void _configure() {
    _configureInsuranceModule();
  }

  void _configureInsuranceModule() {
    _configureBlocs();
    _configureRepositories();
    _configureDataSources();
    _configureExternal();
    _configureCommon();
    _configureUtils();
    _configureDao();
  }



  @Register.singleton(ArticlePageBloc)

  void _configureBlocs();


  @Register.factory(ArticleRepository, from: ArticleRepositoryImpl)

  void _configureRepositories();

  @Register.factory(RemoteDataSource)
  void _configureDataSources();

  @Register.singleton(HttpClient)
  void _configureExternal();

  @Register.factory(NetworkInfoImpl)
  void _configureCommon();

  void _configureUtils();

  // @Register.factory(CommunityDao)
  // @Register.factory(UserDao)
  void _configureDao();
}
