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
}
