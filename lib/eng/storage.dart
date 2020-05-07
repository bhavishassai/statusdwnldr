
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:statusdwnldr/eng/device_permission.dart';

class Storage {


Future<List<FileSystemEntity>>  read()async{
List<FileSystemEntity> fileEntity;
PermissionStatus status  = await DevicePermission().getStoragePermission();
  if(status.isGranted){
 fileEntity  = Directory("/storage/emulated/0/WhatsApp/Media/.Statuses").listSync();
  print("Files collected ");
  return fileEntity;

  }
  else{
    fileEntity = null;
    print("Files Not collected");
    return fileEntity;
  }

  
}


}