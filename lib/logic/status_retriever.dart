import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mime/mime.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:statusdwnldr/logic/device_permission.dart';

class StatusRetriever with ChangeNotifier {
  List<FileSystemEntity> _fse = new List<FileSystemEntity>();
  PermissionStatus _status;

  //getter for FILE_SYSTEM_ENTITY
  List<FileSystemEntity> get fileSystemEntity {
    return _fse;
  }

  void retrieve() async {
    List<FileSystemEntity> fse;
   /* The function retrieve is used to retrieve the status from the whatsapp .Statuses folder.
    .Statuses is a hidden folder.
   */
    _status =
        await DevicePermission().getStoragePermission(); //Get the permission
    if (_status.isGranted) {
      fse =
          Directory("/storage/emulated/0/WhatsApp/Media/.Statuses").listSync();
          print("Files collected ");
      // The above line will fetch all the FILE_SYSTEM_ENTITY present in .Statuses folder.
      // lookupMimeType(path) This will check whether the FILE_SYSTEM_ENTITY is image/jpeg or video/mp4
      for (var u in fse) {
        if (lookupMimeType(u.path) == "image/jpeg") {
          _fse.add(u);
        }
      }

      
      notifyListeners();
    } else {
      SystemNavigator.pop();
      /* If permission is not granted the app will exit. This is recommended only for android.
      In iOS SystemNavigator.pop() doesn't work . exit(0) works in iOS ,but 
       Apple may SUSPEND YOUR APP because it's against Apple Human Interface
       guidelines to exit the app programmatically. */

    }
  }
}
