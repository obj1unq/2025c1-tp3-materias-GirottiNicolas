import universidad.HistorialDeEstudiante


class Estudiante {
    var property historial = new HistorialDeEstudiante()
    
    method carreras(){
        return []
    }

    method materiasAprobadas(){} // SOLO PARA TEST

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

    method inscripciones(){
        return self.materiasDeCarreras().filter({
            materia => materia.inscripcion().estaInscripto(self)
        })
    }

    method materiasEnListaDeEspera(){
        return self.materiasDeCarreras().filter({
            materia => materia.listaDeEspera().contains(self)
        })
    }

    method materiasQuePuedeInscribirseDe(carrera){
        return if(self.carreras().contains(carrera)){ self.materiasParaInscribirse(carrera) } else { [] }
    }

    method materiasParaInscribirse(carrera){
        return carrera.materias().asSet().difference(self.inscripciones())
    }

}