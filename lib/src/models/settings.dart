enum AppType { 
  local, 
  cloud, 
  notset; 

  String toJson() => name;
  static AppType fromJson(String json) => values.byName(json);
}

class Settings {
  bool isFirstAppLoad;
  AppType appType;
  String mediaPath;

  Settings(
      {this.isFirstAppLoad = true,
      this.appType = AppType.notset,
      this.mediaPath = "/media"});


  bool get isLocal => appType == AppType.local || appType == AppType.notset;
  bool get isCloud => appType == AppType.cloud || appType == AppType.notset;

  factory Settings.fromJson(dynamic json) => Settings(
        isFirstAppLoad: json['isFirstAppLoad'] as bool,
        appType: AppType.fromJson(json['appType']),
        mediaPath: json['mediaPath'] as String,
      );

  Map<String, dynamic> toJson() {
    return {
      'isFirstAppLoad': isFirstAppLoad,
      'appType': appType.toJson(),
      'mediaPath': mediaPath,
    };
  }
}
