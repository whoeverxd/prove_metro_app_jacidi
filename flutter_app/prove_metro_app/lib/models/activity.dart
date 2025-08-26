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
  /*
  * PUNTOS VALIDADOS POR MI
  * Que cargue bien un objeto válido.
  * Que si la imagen no es jpg o png, ponga la imagen por defecto.
  * Que corrija errores de datos (ej. simages/ → images/).
  * Que aplique un placeholder si falta imagen.
  * */
  factory Activity.fromJson(Map<String, dynamic> json) {
    String img = json['imagen'] ?? '';


    if (!img.toLowerCase().endsWith('.jpg') &&
        !img.toLowerCase().endsWith('.png')) {
      img = 'images/SALA_ACTIVIDADES_02-300x225.jpg'; // imagen por defecto es un interior de sala de actividades, bastante neutra.
    }
    // Corregir rutas comunes con typo automáticamente
    img = img.replaceFirst('simages/', 'images/');
    img = 'assets/$img';
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
