import expediciones.*

class Vikingo {
    var property casta
    var property oro

    method puedeSubirAExpedicion(expedicion) {
        self.esProductivo() && casta.puedeIr(self, expedicion)
    }

    method esProductivo()

    method puedeAscenderDeCasta(){
        casta.ascenderDeCasta(self)
    }

    method ascenderJarl()
}

class Soldado inherits Vikingo {
    var cantArmas
    var cantBajas

    override method esProductivo() {
        cantBajas > 20 && self.tieneArmas()
    }

    method tieneArmas() {
        return cantArmas > 0
    }

    override method ascenderJarl() {
        cantArmas += 10
    }
}

class Granjero inherits Vikingo {
    var cantHijos
    var cantHectareas

    override method esProductivo() {
        self.puedeAlimentarASusHijos()
    }

    method puedeAlimentarASusHijos() {
        return cantHectareas.div(cantHijos) > 2
    }

    override method ascenderJarl() {
        cantHectareas += 2
        cantHijos += 2
    }
}

object jarl {
    method puedeIr(vikingo, expedicion) {
        not vikingo.tieneArmas()
    }

    method ascenderDeCasta(vikingo) {
        vikingo.ascenderJarl()
        vikingo.casta(castaMedia)
    }
    
}

object castaMedia {
    method puedeIr(vikingo, expedicion) = true

    method ascenderDeCasta(vikingo) {
        vikingo.casta(nobles)
    }
}

object nobles {
    method puedeIr(vikingo, expedicion) = true

    method ascenderDeCasta(vikingo) {
        throw new Exception(message = "No se puede ascender mas alla de noble")
    }
}

