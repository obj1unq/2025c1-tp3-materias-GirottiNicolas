import universidad.*
import carreras.*



object trabajoFinal inherits Materia(carrera = programacion) {}

object quimica inherits Materia(carrera = medicina) {}
object anatomiaGeneral inherits Materia(carrera = medicina) {}


object elementosDeProgramacion inherits Materia(carrera = programacion){}

object objetos1 inherits Materia(carrera = programacion){}

object matematica1 inherits Materia(carrera = programacion) {
}

object basesDeDatos inherits Materia(carrera = programacion) {}
object objetos2 inherits Materia(carrera = programacion, cupo=3) {
    override method requisitos(){
        return [matematica1,objetos1]
    }
}

object objetos3 inherits Materia(carrera = programacion,cupo=3) {
    override method requisitos(){
        return [objetos2, basesDeDatos]
    }
}

object programacionConcurrente inherits Materia(carrera = programacion) {

    override method requisitos() {
        return [objetos1, basesDeDatos]
    }
}



object biologia1 inherits Materia(carrera = medicina) {}

object biologia2 inherits Materia(carrera = medicina) {
    override method requisitos() {
        return [biologia1]
    }
}