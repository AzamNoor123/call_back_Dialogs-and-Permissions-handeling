part of 'url_lancher_bloc.dart';

@immutable
abstract class UrlLancherEvent {}

class UrlCallEvent extends UrlLancherEvent {}

class UrlSmsEvent extends UrlLancherEvent {}

class LocationEvent extends UrlLancherEvent {}

class SettingPermissionEvent extends UrlLancherEvent {}
