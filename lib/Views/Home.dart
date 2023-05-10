import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_5_callbacks_dialogs/Views/DialogUtils.dart';
import 'package:task_5_callbacks_dialogs/helper/common_keys.dart';
import 'package:task_5_callbacks_dialogs/helper/string_resources.dart';
import 'package:task_5_callbacks_dialogs/helper/widget_extension.dart';
import '../BLOC/URL_Lancher/bloc/url_lancher_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringResources.HOMESCREEN),
      ),
      body: BlocBuilder<UrlLancherBloc, UrlLancherState>(
        builder: (context, state) {
          if (state is LoadingMapState) {
            return const CircularProgressIndicator();
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        DialogUtils.callDialog(
                            context,
                            StringResources.CALL_DIALOG,
                            StringResources.CALL_CONTENT,
                            CommonKeys.CALL_KEY);
                      },
                      child: Text(StringResources.CALL_BTN)),
                  ElevatedButton(
                      onPressed: () {
                        DialogUtils.callDialog(
                            context,
                            StringResources.SMS_DIALOG,
                            StringResources.SMS_CONTENT,
                            CommonKeys.SMS_KEY);
                      },
                      child: Text(StringResources.SMS_BTN))
                ],
              ).centerwidget,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        DialogUtils.callDialog(
                            context,
                            StringResources.LOCATION_DIALOG,
                            StringResources.LOCATION_CONTENT,
                            CommonKeys.LOCATION_KEY);
                      },
                      child: Text(StringResources.LOCATION_BTN)),
                  BlocListener<UrlLancherBloc, UrlLancherState>(
                    listener: (context, state) {
                      if (state is SettingPermissionGranted) {
                        DialogUtils.permissionDialog(context);
                      } else {
                        BlocProvider.of<UrlLancherBloc>(context)
                            .add(SettingPermissionEvent());
                      }
                    },
                    child: ElevatedButton(
                        onPressed: () async {
                          BlocProvider.of<UrlLancherBloc>(context)
                              .add(SettingPermissionEvent());
                        },
                        child: Text(StringResources.STORAGE_BTN)),
                  )
                ],
              ).centerwidget
            ],
          );
        },
      ).centerwidget,
    );
  }
}
