import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:task_5_callbacks_dialogs/helper/contant_resources.dart';
import 'package:url_launcher/url_launcher.dart';
part 'url_lancher_event.dart';
part 'url_lancher_state.dart';

class UrlLancherBloc extends Bloc<UrlLancherEvent, UrlLancherState> {
  UrlLancherBloc() : super(UrlLancherInitial()) {
    String phonenumber = ConstResources.phone;
    on<UrlCallEvent>((event, emit) async {
      final launchUri = Uri(scheme: ConstResources.tel, path: phonenumber);
      await launchUrl(launchUri);
    });
    on<UrlSmsEvent>((event, emit) async {
      final launchUri = Uri(scheme: ConstResources.sms, path: phonenumber);
      await launchUrl(launchUri);
    });
    on<LocationEvent>((event, emit) {
      LoadingMapState();
      loadmap();
      LoadedMapState();
    });
    on<SettingPermissionEvent>((event, emit) async {
      var ststus = await Permission.storage.status;
      if (ststus.isGranted) {
        emit(SettingPermissionGranted());
      } else if (ststus.isDenied) {
        Permission.storage.request();
      }
    });
    on<OpenSettingPermission>((event, emit) {
      openAppSettings();
    });
  }
  loadmap() async {
    final status = Permission.location.status;

    if (await status.isGranted) {
      final avail = await MapLauncher.installedMaps;
      avail.first.showMarker(
          coords: Coords(ConstResources.maplat, ConstResources.maplang),
          title: ConstResources.iqbalpark,
          description: ConstResources.lahorePark,
          zoom: ConstResources.mapzoom);

      MapLauncher.showDirections(
          mapType: MapType.google,
          destination: Coords(ConstResources.maplat, ConstResources.maplang));
    } else {
      Permission.location.request();
    }
  }
}
