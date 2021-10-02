class RadioModel {
  late final String name;
  late final String radioUrl;
  RadioModel(this.name, this.radioUrl);
  RadioModel.fromJson(Map<String, String> json) {
    name = json['name']!;
    radioUrl = json['radioUrl']!;
  }
}
