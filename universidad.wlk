import carreras.*

object universidad {
    const carreras = [programacion, medicina,derecho ]
}



class Carrera {
    method materias()
}


class Materia {
    
    var property carrera  

    const property estudiantes = #{}
    
    method cupo(){ return 30}

    method requisitos() {return []}


    method inscribir(estudiante){
        self.validarInscripcion(estudiante)
        estudiantes.add(estudiante)
    }

    method validarInscripcion(estudiante){
        if(!self.cumpleRequisitos(estudiante)){
            self.error("No se puede inscribir")
        }
    }

    method inscriptos(){
        return estudiantes
    }

    method puedeInscribirse(estudiante){
        return self.perteneceACarrera(estudiante) && !estudiante.aprobo(self) && !self.estaInscripto(estudiante) && self.cumpleRequisitos(estudiante)
    }

    method cumpleRequisitos(estudiante){
        return self.requisitos().all({
                materia => estudiante.aprobo(materia)
        })  
    }

    method estaInscripto(estudiante){
        return estudiantes.contains(estudiante)
    }

    method perteneceACarrera(estudiante){
        return estudiante.materiasDeCarreras().contains(self)
    }

    method validarNota(estudiante){
        if (estudiante.aprobo(self)){
            self.error("Error de registro: No se puede aprobar la materia dos veces")
        }
    }

    method subirNota(estudiante,nota){
        self.validarNota(estudiante)
        estudiante.historial().registrar(new ActaDeMateria(materia = self,nota = nota))
    }

}



class Historial {
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
        return self.materiasAprobadas().findOrDefault({
                                        acta => acta.materia() == materia }
                                        ,false)
    }

    // Registrar materia
    method registrar(nota){
        actasDeMaterias.add(nota)
    }

    method promedioMaterias(){
        return self.notas().average()
    }
}


class ActaDeMateria {
    var property materia
    var property nota  
 
}