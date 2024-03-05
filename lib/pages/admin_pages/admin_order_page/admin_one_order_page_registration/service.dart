class Service{
  String id;
  final String serviceName;
  final int serviceDuration;
  final int priceOfService;



  Service({
    this.id = '',
    required this.serviceName,
    required this.serviceDuration,
    required this.priceOfService,

  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'serviceName': serviceName,
    'serviceDuration': serviceDuration,
    'priceOfService': priceOfService,
  };

  static Service fromJson(Map<String, dynamic> json) => Service(
    id: json['id'],
    serviceName: json['serviceName'],
    serviceDuration: json['serviceDuration'], 
    priceOfService: json['priceOfService'], 
  );
}