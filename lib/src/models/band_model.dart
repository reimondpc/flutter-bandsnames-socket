class BandModel {
  String id;
  String name;
  int votes;

  BandModel({this.id, this.name, this.votes});

  factory BandModel.fromMap(Map<String, dynamic> obj) {
    return BandModel(
      id: obj.containsKey('id') ? obj['id'] : 'on-id',
      name: obj.containsKey('name') ? obj['name'] : 'on-name',
      votes: obj.containsKey('votes') ? obj['votes'] : 'on-votes',
    );
  }
}
