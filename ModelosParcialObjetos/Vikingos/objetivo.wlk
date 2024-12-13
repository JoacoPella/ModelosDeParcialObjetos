import expediciones.*

class Objetivo {

    method valeLaPena(expedicion)

    method calcularBotin()

    method fueSaqueada() {
        self.calcularBotin() {
            return 0
        }
    }
}

class Capital inherits Objetivo {
    const factorRiqueza  // 0 < factorRiqueza
    const cantDefensores

    override method valeLaPena(expedicion) {
        self.calcularBotin().div(expedicion.cantVikingos()) > 3
    }

    override method calcularBotin() {
        return cantDefensores * factorRiqueza
    }
}

class Aldea inherits Objetivo {
    const cantDeCrucifijos

    override method valeLaPena(expedicion) {
        self.calcularBotin() >= 15
    }

    override method calcularBotin() = cantDeCrucifijos
}

class AldeaAmurallada inherits Aldea {
    const cantMinimaDeVikingos

    override method valeLaPena(expedicion) {
        self.calcularBotin() >= 15 && expedicion.cantVikingos() > cantMinimaDeVikingos
    }
}