class Temp {
  int? min;
  int? max;

  Temp({
    this.min,
    this.max,
  });

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        min: (json['min'] as num?)?.round(),
        max: (json['max'] as num?)?.round(),
      );

  Map<String, dynamic> toJson() => {
        'min': min,
        'max': max,
      };
}
