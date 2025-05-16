


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
