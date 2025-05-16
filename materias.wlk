import requisito.*
import universidad.*
import materia.*



object trabajoFinal inherits Materia(carrera = programacion) {
     override method ciclo(){
        return 4
    }

    override method requisito(){
        return new RequisitoCredito(creditoNecesario = 250, carrera = carrera)
    }
}

object quimica inherits Materia(carrera = medicina) {}
object anatomiaGeneral inherits Materia(carrera = medicina) {}


object elementosDeProgramacion inherits Materia(carrera = programacion){}

object objetos1 inherits Materia(carrera = programacion){}

object matematica1 inherits Materia(carrera = programacion) {
}

object basesDeDatos inherits Materia(carrera = programacion) {}
object objetos2 inherits Materia(carrera = programacion, cupo=3) {
    /*override method requisitos(){
        return [matematica1,objetos1]
    }*/
    override method ciclo(){
        return 2
    }
    override method requisito(){
        return new RequisitoPorCiclo(cicloNecesario = 1, carrera = carrera)
    }

}

object objetos3 inherits Materia(carrera = programacion,cupo=3) {
    //override method requisitos(){ return [objetos2, basesDeDatos]}
    override method ciclo(){
        return 3
    }
    override method requisito(){
        return new RequisitoPorCiclo(cicloNecesario = 2, carrera = carrera)
    }
}

object programacionConcurrente inherits Materia(carrera = programacion) {

    //override method requisitos() {return [objetos1, basesDeDatos] }
     override method ciclo(){
        return 3
    }
}



object biologia1 inherits Materia(carrera = medicina) {}

object biologia2 inherits Materia(carrera = medicina) {
    //override method requisitos() {return [biologia1] }
}