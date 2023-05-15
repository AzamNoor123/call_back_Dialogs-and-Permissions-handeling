part of 'url_lancher_bloc.dart';

@immutable
abstract class UrlLancherState {}

class UrlLancherInitial extends UrlLancherState {}

class UrlLancherCalling extends UrlLancherState {}

class UrlLancherSmS extends UrlLancherState {}

class LoadingMapState extends UrlLancherState {}

class LoadedMapState extends UrlLancherState {}

class SettingPermissionGranted extends UrlLancherState {}

class SettingPermissionNotGranted extends UrlLancherState {}

class OpenSettingState extends UrlLancherState {}
