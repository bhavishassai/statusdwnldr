import 'dart:io';
import 'package:mime/mime.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:statusdwnldr/eng/device_permission.dart';

class Storage {


Future<List<FileSystemEntity>>  read()async{
List<FileSystemEntity> fileEntity;
List<FileSystemEntity> fe = List<FileSystemEntity>();
PermissionStatus status  = await DevicePermission().getStoragePermission();
  if(status.isGranted){
 fileEntity  = Directory("/storage/emulated/0/WhatsApp/Media/.Statuses").listSync();
  print("Files collected ");
  for(var u in fileEntity){

    if(lookupMimeType(u.path)=="image/jpeg"){
      fe.add(u);
    }
  
  }
  return fe;

  }
  else{
    fileEntity = null;
    print("Files Not collected");
    return fileEntity;
  }

  
}


}