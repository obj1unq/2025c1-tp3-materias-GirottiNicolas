import materias.*


class Carrera {
    method materias()
    method perteneceACarrera(materia){
        return self.materias().contains(materia)
    }
    
}



object programacion inherits Carrera {
    override method materias(){ 
        return 
            [elementosDeProgramacion
            ,matematica1
            ,basesDeDatos
            ,objetos1
            ,objetos2
            ,programacionConcurrente
            ]
    }
}


object medicina inherits Carrera {
    override method materias(){
        return [
            quimica
            ,biologia1
            ,biologia2
            ,anatomiaGeneral
        ]
    }
}


object derecho inherits Carrera {
    override method materias() {
    }
}

