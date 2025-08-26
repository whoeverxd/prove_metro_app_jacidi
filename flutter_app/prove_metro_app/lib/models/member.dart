class Member {
  final int id;
  final String nombre;
  final String apellidos;
  final String dni;

  Member({
    required this.id,
    required this.nombre,
    required this.apellidos,
    required this.dni,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['idPersona'],
      nombre: json['nombre'],
      apellidos: json['apellidos'],
      dni: json['DNI'],
    );
  }
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
