class StandAnimation {
  final int id;
  final String displayName;
  final int usage;

  StandAnimation(this.id, this.displayName, this.usage);

  StandAnimation.fromJson(Map<String, dynamic> json)
      : id = json['Id'],
        displayName = json['DisplayName'],
        usage = json['Usage'];
}
