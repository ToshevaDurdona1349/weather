class DayTimeWeather {
  Location? location;
  Current? current;
  Forecast? forecast;

  DayTimeWeather({this.location, this.current, this.forecast});

  DayTimeWeather.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    current =
    json['current'] != null ? new Current.fromJson(json['current']) : null;
    forecast = json['forecast'] != null
        ? new Forecast.fromJson(json['forecast'])
        : null;
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
  String? text;

  Condition({this.icon, this.text});

  Condition.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    text=json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    return data;
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

class Forecast {
  List<Forecastday>? forecastday;

  Forecast({this.forecastday});

  Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      forecastday = <Forecastday>[];
      json['forecastday'].forEach((v) {
        forecastday!.add(new Forecastday.fromJson(v));
      });
    }
  }


}

class Forecastday {
  String? date;
  int? dateEpoch;
  Day? day;
  Astro? astro;
  List<Hour>? hour;

  Forecastday({this.date, this.dateEpoch, this.day, this.astro, this.hour});

  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dateEpoch = json['date_epoch'];
    day = json['day'] != null ? new Day.fromJson(json['day']) : null;
    astro = json['astro'] != null ? new Astro.fromJson(json['astro']) : null;
    if (json['hour'] != null) {
      hour = <Hour>[];
      json['hour'].forEach((v) {
        hour!.add(new Hour.fromJson(v));
      });
    }
  }


}

class Day {
  double? maxtempC;
  double? mintempC;
  double? maxwindMph;
  double? totalsnowCm;
  int? dailyWillItRain;
  int? dailyChanceOfRain;
  int? dailyWillItSnow;
  int? dailyChanceOfSnow;
  Condition? condition;
  AirQuality? airQuality;

  Day(
      {this.maxtempC,
        this.mintempC,
        this.maxwindMph,
        this.totalsnowCm,
        this.dailyWillItRain,
        this.dailyChanceOfRain,
        this.dailyWillItSnow,
        this.dailyChanceOfSnow,
        this.condition,
        this.airQuality});

  Day.fromJson(Map<String, dynamic> json) {
    maxtempC = json['maxtemp_c'];
    mintempC = json['mintemp_c'];
    maxwindMph = json['maxwind_mph'];
    totalsnowCm = json['totalsnow_cm'];
    dailyWillItRain = json['daily_will_it_rain'];
    dailyChanceOfRain = json['daily_chance_of_rain'];
    dailyWillItSnow = json['daily_will_it_snow'];
    dailyChanceOfSnow = json['daily_chance_of_snow'];
    condition = json['condition'] != null
        ? new Condition.fromJson(json['condition'])
        : null;
    airQuality = json['air_quality'] != null
        ? new AirQuality.fromJson(json['air_quality'])
        : null;
  }


}

class Condition1 {
  String? text;
  String? icon;

  Condition1({this.text, this.icon});

  Condition1.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
  }

 }

class Astro {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  int? moonIllumination;
  int? isMoonUp;
  int? isSunUp;

  Astro(
      {this.sunrise,
        this.sunset,
        this.moonrise,
        this.moonset,
        this.moonPhase,
        this.moonIllumination,
        this.isMoonUp,
        this.isSunUp});

  Astro.fromJson(Map<String, dynamic> json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moon_phase'];
    moonIllumination = json['moon_illumination'];
    isMoonUp = json['is_moon_up'];
    isSunUp = json['is_sun_up'];
  }


}

class Hour {
  int? timeEpoch;
  String? time;
  double? tempC;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  String? windDir;
  double? pressureMb;
  double? pressureIn;
  double? precipMm;
  int? cloud;
  double? windchillC;
  double? heatindexC;
  double? dewpointC;
  int? willItRain;
  int? chanceOfRain;
  int? willItSnow;
  int? chanceOfSnow;
  AirQuality? airQuality;

  Hour(
      {this.timeEpoch,
        this.time,
        this.tempC,
        this.isDay,
        this.condition,
        this.windMph,
        this.windKph,
        this.windDegree,
        this.windDir,
        this.pressureMb,
        this.pressureIn,
        this.precipMm,
        this.cloud,
        this.windchillC,
        this.heatindexC,
        this.dewpointC,
        this.willItRain,
        this.chanceOfRain,
        this.willItSnow,
        this.chanceOfSnow,
        this.airQuality});

  Hour.fromJson(Map<String, dynamic> json) {
    timeEpoch = json['time_epoch'];
    time = json['time'];
    tempC = json['temp_c'];
    isDay = json['is_day'];
    condition = json['condition'] != null
        ? new Condition.fromJson(json['condition'])
        : null;
    windMph = json['wind_mph'];
    windKph = json['wind_kph'];
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressureMb = json['pressure_mb'];
    pressureIn = json['pressure_in'];
    precipMm = json['precip_mm'];
    cloud = json['cloud'];
    windchillC = json['windchill_c'];
    heatindexC = json['heatindex_c'];
    dewpointC = json['dewpoint_c'];
    willItRain = json['will_it_rain'];
    chanceOfRain = json['chance_of_rain'];
    willItSnow = json['will_it_snow'];
    chanceOfSnow = json['chance_of_snow'];
    airQuality = json['air_quality'] != null
        ? new AirQuality.fromJson(json['air_quality'])
        : null;
  }


}


