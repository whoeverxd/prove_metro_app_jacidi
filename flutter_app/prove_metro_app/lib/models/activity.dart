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
    String img = json['imagen'] ?? '';
    print('Imagen original: $img');
    if (!img.toLowerCase().endsWith('.jpg') &&
        !img.toLowerCase().endsWith('.png')) {
      img = 'assets/images/HEADER_WELCOME_TO_THE_CLUB-300x169.jpg'; // imagen por defecto
    }
    return Activity(
      id: json['idActividadColectiva'],
      nombre: json['nombreActividadColectiva'],
      descripcion: json['descripcion'],
      imagen: img,

      entrenadorId: json['entrenadorResponsable'],
      sociosInscritos: List<int>.from(json['sociosInscritos']),
      dia: json['diaClase'],
      hora: json['horaClase'],
    );
  }

  toJson() {

    return {
      'idActividadColectiva': id,
      'nombreActividadColectiva': nombre,
      'descripcion': descripcion,
      'imagen': imagen,
      'entrenadorResponsable': entrenadorId,
      'sociosInscritos': sociosInscritos,
      'diaClase': dia,
      'horaClase': hora,
    };
  }
}
