class Activity {
  final int id;
  final String nombre;
  final String descripcion;
  final String imagen;
  final int entrenadorId;
  final List<int> sociosInscritos;
  final String dia;
  final String hora;

  Activity({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.imagen,
    required this.entrenadorId,
    required this.sociosInscritos,
    required this.dia,
    required this.hora,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      id: json['idActividadColectiva'],
      nombre: json['nombreActividadColectiva'],
      descripcion: json['descripcion'],
      imagen: json['imagen'],
      entrenadorId: json['entrenadorResponsable'],
      sociosInscritos: List<int>.from(json['sociosInscritos']),
      dia: json['diaClase'],
      hora: json['horaClase'],
    );
  }
}
