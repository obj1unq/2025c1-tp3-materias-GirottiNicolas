import estudiantes.roque


class Requisito {
    var property requisito = null
    method cumpleRequisito(estudiante)
}


class RequisitoCredito inherits Requisito() {
    var property creditoNecesario
    var property carrera
    override method cumpleRequisito(estudiante){
        return estudiante.creditos(carrera) >= creditoNecesario
    }


}



class RequisitoPorCiclo inherits Requisito {
    var property cicloNecesario
    var property carrera

    method materiasObligatorias(){
        return carrera.materias().filter({
                        materia => cicloNecesario >= materia.ciclo() })
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