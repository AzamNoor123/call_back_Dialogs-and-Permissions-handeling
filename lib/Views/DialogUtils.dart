import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_5_callbacks_dialogs/BLOC/URL_Lancher/bloc/url_lancher_bloc.dart';
import 'package:task_5_callbacks_dialogs/helper/common_keys.dart';

import '../helper/string_resources.dart';

class DialogUtils {
  static callDialog(context, title, content, eventClick) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    eventClick == CommonKeys.CALL_KEY
                        ? BlocProvider.of<UrlLancherBloc>(context)
                            .add(UrlCallEvent())
                        : eventClick == CommonKeys.SMS_KEY
                            ? BlocProvider.of<UrlLancherBloc>(context)
                                .add(UrlSmsEvent())
                            : eventClick == CommonKeys.LOCATION_KEY
                                ? BlocProvider.of<UrlLancherBloc>(context)
                                    .add(LocationEvent())
                                : Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text(StringResources.YES_BTN)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(StringResources.NO_BTN))
            ],
          );
        });
  }

  static permissionDialog(context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(StringResources.STORAGE_DIALOG),
        content: Text(StringResources.STORAGE_CONTENT),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(StringResources.OK_BTN))
        ],
      ),
    );
  }
}
