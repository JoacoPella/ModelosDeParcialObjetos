import Periodista.*

object medio {
    const periodistas = []

    method periodistasNovatosDeActividadReciente(){
        return self.periodistasNovatos().filter({ periodista => periodista.tuvoActividadReciente() })
    }

    method periodistasNovatos(){
        return periodistas.filter({ periodista => periodista.esNovato() })
    }
}