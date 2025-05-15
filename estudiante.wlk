import universidad.Historial


class Estudiante {
    var property historial = new Historial()
    
    method carreras(){
        return []
    }

    method promedio(){
        return historial.promedioMaterias()
    }

    method aprobo(materia){
        return historial.aprobo(materia)
    }

    method cantMateriasAprobadas(){
        return historial.aprobadas()
    }

    method materiasDeCarreras() {
        return self.carreras().map({ carrera => carrera.materias() }).flatten()
    }

}