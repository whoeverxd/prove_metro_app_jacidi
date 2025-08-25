class Trainer {
  final int id;
  final String nombre;
  final String apellidos;
  final String dni;
  final String cv;
  final List<int> actividades;

  Trainer({
    required this.id,
    required this.nombre,
    required this.apellidos,
    required this.dni,
    required this.cv,
    required this.actividades,
  });

  factory Trainer.fromJson(Map<String, dynamic> json) {
    return Trainer(
      id: json['idTrainer'],
      nombre: json['nombre'],
      apellidos: json['apellidos'],
      dni: json['DNI'],
      cv: json['cv'],
      actividades: List<int>.from(json['actividades']),
    );
  }
}
