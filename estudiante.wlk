

class Estudiante {
    var property historial = new HistorialDeEstudiante()
    
    var property creditos = 0 

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



class HistorialDeEstudiante {
    const actasDeMaterias = #{}
    method agregarMateria(){}

    method notas(){ 
        return actasDeMaterias.map({ acta =>  acta.nota() })
    }

    method aprobadas(){
        return self.materiasAprobadas().size()
    }

    method materiasAprobadas(){
        return actasDeMaterias.filter({
                        materia => materia.nota() > 6  
        })
    }

    method aprobo(materia){
        return self.materiasDeActas(self.materiasAprobadas()).contains(materia)
    }

    method materiasDeActas(actas){
        return actas.map({ acta => acta.materia()})
    }

    method registrar(nota){
        actasDeMaterias.add(nota)
    }

    method promedioMaterias(){
        return self.notas().average()
    }
}