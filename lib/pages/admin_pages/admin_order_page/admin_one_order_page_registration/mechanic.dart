

class Mechanic{
  String id;
  final String mechanicName;
  final String mechanicSurname;
  final String mechanicSpecialization;
  final List<dynamic> mechanicDaysOfWork;
  final int mechanicHourSalary;

  Mechanic({
    this.id = '',
    required this.mechanicName,
    required this.mechanicSurname,
    required this.mechanicSpecialization,
    required this.mechanicDaysOfWork,
    required this.mechanicHourSalary,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'mechanicName': mechanicName,
    'mechanicSurname': mechanicSurname,
    'mechanicSpecialization': mechanicSpecialization,
    'mechanicDaysOfWork': mechanicDaysOfWork,
    'mechanicHourSalary': mechanicHourSalary,
  };

  static Mechanic fromJson(Map<String, dynamic> json) => Mechanic(
    id: json['id'],
    mechanicName: json['mechanicName'],
    mechanicSurname: json['mechanicSurname'], 
    mechanicSpecialization: json['mechanicSpecialization'], 
    mechanicDaysOfWork: json['mechanicDaysOfWork'],
    mechanicHourSalary: json['mechanicHourSalary'], 
  );
}