import carreras.*


object universidad {
    const carreras = [programacion, medicina,derecho ]
}



class Carrera {
    method materias()
    
}



class Materia {
    method cantidadDeCreditos(){
        return 12
    }

    method año(){return 1}

    var property carrera  
    var property cupo = 30
    var property listaDeEspera = []
    const property estudiantes = #{}

    const property inscripcion = new Inscripcion(materia = self)
    

    method requisitos() {return []}
    
    method decrementarCupo(){
        cupo -=1
    }
    method inscribir(postulante) {
        inscripcion.inscribir(postulante)
    }

    method validarNota(estudiante){
        if (estudiante.aprobo(self)){
            self.error("Error de registro: No se puede aprobar la materia dos veces")
        }
    }

    method darDeBaja(estudiante){
        if(inscripcion.estaInscripto(estudiante)){
            self.quitarEstudiante(estudiante)
            self.otorgarLugar()
        }
    }

    method quitarEstudiante(estudiante){
        estudiantes.remove(estudiante)
        self.aumentarCupo()
    }

    method otorgarLugar(){
        if (self.hayEstudiantesEnEspera()){
            inscripcion.inscribir(self.primerEstudianteDeEspera())
            self.decrementarCupo()
            listaDeEspera.remove(self.primerEstudianteDeEspera())
        }
    }

    method primerEstudianteDeEspera(){
        return listaDeEspera.first()
    }

    method aumentarCupo(){
        cupo +=1
    }

    method hayEstudiantesEnEspera() {
        return !listaDeEspera.isEmpty()
    }

    method subirNota(estudiante,nota){
        self.validarNota(estudiante)
        estudiante.historial().registrar(new ActaDeMateria(materia = self,nota = nota))
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

class ActaDeMateria {
    var property materia
    var property nota  
 
}
class Inscripcion {
    
    var property materia
    
    method inscribir(postulante){
        self.validarInscripcion(postulante)
        self.inscribirAMateriaOListaDeEspera(postulante)
    }

    method inscribirAMateriaOListaDeEspera(postulante){
        if(self.hayCupo()){ self.inscribirAMateria(postulante) } else { self.inscribirEnLista(postulante)}
        
    }

    method inscribirAMateria(postulante) {
        materia.estudiantes().add(postulante)
        materia.decrementarCupo()
    }

    method inscribirEnLista(postulante){
        materia.listaDeEspera().add(postulante)
    }

    method hayCupo(){
        return  materia.cupo() > 0
    }

    method validarInscripcion(postulante){
        if(!self.puedeInscribirse(postulante)){
            self.error("No se puede inscribir")
        }
    }

    method puedeInscribirse(postulante){
        return self.perteneceACarrera(postulante) && !postulante.aprobo(materia) && !self.estaInscripto(postulante) && self.cumpleRequisitos(postulante)
    }

    method cumpleRequisitos(postulante){
        return materia.requisitos().all({
                materia => postulante.aprobo(materia)
        })  
    }

    method estaInscripto(postulante){
        return materia.estudiantes().contains(postulante)
    }

    method perteneceACarrera(estudiante){
        return estudiante.materiasDeCarreras().contains(materia)
    }
}

