class FilterController {
//  static FilterSingleton _instance;
//  factory FilterSingleton({String subject = "", int day, String time = ""}) {
//    _instance ??= FilterSingleton._internalConstructor(time, day, subject);
//    return _instance;
//  }
//  FilterSingleton._internalConstructor(this.time, this.day, this.subject);

  String subject = "";
  int day = 0;
  String time = "";

  FilterController({ this.subject, this.day, this.time });
}