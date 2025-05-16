import estudiante.*
import inscripcion.*
import requisito.*



class Materia {
    method cantidadDeCreditos(){
        return 12
    }

    method ciclo(){return 1}

    var property carrera  
    var property cupo = 30
    var property listaDeEspera = []
    const property estudiantes = #{}

    const property inscripcion = new Inscripcion(materia = self)
    

    
    method requisito(){return sinRequisito}

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