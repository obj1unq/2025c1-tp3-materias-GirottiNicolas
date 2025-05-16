


class Requisito {
    var property requisito = null
    method cumpleRequisito(estudiante)
}


class RequisitoCredito inherits Requisito() {
    var property creditoNecesario
    override method cumpleRequisito(estudiante){
        return estudiante.creditos() >= creditoNecesario
    }


}

class RequisitoPorCiclo inherits Requisito {
    var property cicloNecesario
    var property carrera

    method materiasObligatorias(){
        return carrera.materias().filter({materia => materia.ciclo() >= cicloNecesario - 1})
    }

    override method cumpleRequisito(estudiante) {
      return self.materiasObligatorias().all({
                        materiaObligatoria => estudiante.aprobo(materiaObligatoria)
      })
    }
}

object sinRequisito inherits Requisito {
    override method cumpleRequisito(estudiante) {return true}
}