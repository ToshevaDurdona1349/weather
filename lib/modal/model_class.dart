class CurrentWeatherData {
  Location? location;
  Current? current;
  //http://api.weatherapi.com/v1/current.json?key=22c51a5c93cb4155994174721230511&q=Tashkent&aqi=yes
  //http://api.weatherapi.com/v1/forecast.json?key=22c51a5c93cb4155994174721230511&q=Tashkent&days=1&aqi=yes&alerts=no
  CurrentWeatherData({this.location, this.current});

  CurrentWeatherData.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    current = json['current'] != null ? new Current.fromJson(json['current']) : null;
  }

}

class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  Location(
      {this.name,
        this.region,
        this.country,
        this.lat,
        this.lon,
        this.tzId,
        this.localtimeEpoch,
        this.localtime});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    tzId = json['tz_id'];
    localtimeEpoch = json['localtime_epoch'];
    localtime = json['localtime'];
  }


}

class Current {
  double? tempC;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  double? pressureIn;
  int? humidity;
  int? cloud;
  AirQuality? airQuality;

  Current(
      {this.tempC,
        this.isDay,
        this.condition,
        this.windMph,
        this.windKph,
        this.windDegree,
        this.pressureIn,
        this.humidity,
        this.cloud,
        this.airQuality});

  Current.fromJson(Map<String, dynamic> json) {
    tempC = json['temp_c'];
    isDay = json['is_day'];
    condition = json['condition'] != null
        ? new Condition.fromJson(json['condition'])
        : null;
    windMph = json['wind_mph'];
    windKph = json['wind_kph'];
    windDegree = json['wind_degree'];
    pressureIn = json['pressure_in'];
    humidity = json['humidity'];
    cloud = json['cloud'];
    airQuality = json['air_quality'] != null
        ? new AirQuality.fromJson(json['air_quality'])
        : null;
  }


}

class Condition {
  String? icon;

  Condition({this.icon});

  Condition.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
  }

}

class AirQuality {
  double? co;
  double? no2;
  double? o3;
  double? so2;
  double? pm25;
  double? pm10;
  int? usEpaIndex;
  int? gbDefraIndex;

  AirQuality(
      {this.co,
        this.no2,
        this.o3,
        this.so2,
        this.pm25,
        this.pm10,
        this.usEpaIndex,
        this.gbDefraIndex});

  AirQuality.fromJson(Map<String, dynamic> json) {
    co = json['co'];
    no2 = json['no2'];
    o3 = json['o3'];
    so2 = json['so2'];
    pm25 = json['pm2_5'];
    pm10 = json['pm10'];
    usEpaIndex = json['us-epa-index'];
    gbDefraIndex = json['gb-defra-index'];
  }


}
