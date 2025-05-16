import materias.*
import carreras.*
import estudiante.*


object roque inherits Estudiante {
    override method carreras(){
        return [programacion,medicina]
    }
    override method materiasAprobadas() {
        return [elementosDeProgramacion,matematica1,objetos1,basesDeDatos,biologia1]
    }

}


object luisa inherits Estudiante {
    override method carreras(){
        return [programacion]
    }
    // SOLO PARA TEST
    override method materiasAprobadas() {
        return [elementosDeProgramacion,objetos1,matematica1]
    }
}

object romina inherits Estudiante {
    override method carreras(){
            return [programacion]
        }
    // SOLO PARA TEST
    override method materiasAprobadas() {
        return [elementosDeProgramacion,objetos1,matematica1]
    }
}

object alicia inherits Estudiante {
    override method carreras(){
            return [programacion]
        }
    override method materiasAprobadas() {
        return [elementosDeProgramacion,objetos1,matematica1]
    }
}


object ana inherits Estudiante {
    override method carreras(){
            return [programacion]
        }
    override method materiasAprobadas() {
        return [elementosDeProgramacion]
    }
}