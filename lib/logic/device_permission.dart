import 'package:permission_handler/permission_handler.dart';

class DevicePermission {
  Future<PermissionStatus> getStoragePermission() async {
    

    PermissionStatus status = await Permission.storage.status;
    if (status.isGranted) {
   
      print("Permission Already Granted");
    } else {
      status = await Permission.storage.request();
      if (status.isGranted) {
        print("Granted Permission");
       
      } else {
        
        print("User Denied Permission");
      }
    }
    return status;
  }
}
