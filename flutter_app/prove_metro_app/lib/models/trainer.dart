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
  /// Getter calculado → devuelve nombre completo sin comas raras
  String get fullName {
    // Divide por coma y elimina espacios extra
    final parts = this.apellidos.split(',')
        .map((p) => p.trim())
        .where((p) => p.isNotEmpty)
        .toList();

    // Une los apellidos en orden natural con espacios
    final cleanApellidos = parts.join(' ');

    return "$nombre $cleanApellidos";
  }

}
