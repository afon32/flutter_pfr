

class Garage{
  String id;
  final String garageName;
  final int garageCapacity;
  final bool garageLiftJack;
  final List<dynamic> daysOfWork;

  Garage({
    this.id = '',
    required this.garageName,
    required this.garageCapacity,
    required this.garageLiftJack,
    required this.daysOfWork,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'garageName': garageName,
    'garageCapacity': garageCapacity,
    'garageLiftJack': garageLiftJack,
    'daysOfWork': daysOfWork,
  };

  static Garage fromJson(Map<String, dynamic> json) => Garage(
    id: json['id'],
    garageName: json['garageName'],
    garageCapacity: json['garageCapacity'], 
    garageLiftJack: json['garageLiftJack'], 
    daysOfWork: json['daysOfWork'],
  );
}