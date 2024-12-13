class SalaDeEscape {
    const  nombre
    const  dificultad

    method nombre() = nombre    

    method precioBase() {
        return 10000
    }

    method precioExtraXGenero()

    method  precioTotal() {
        return self.precioBase() + self.precioExtraXGenero()
    }

    method esDificil() {
        return dificultad > 7 && self.condicionExtraXGenero()
    }

    method condicionExtraXGenero()

    method noEsDificil() {
        return !self.esDificil()
    }
}

class SalaDeEscapeAnime inherits SalaDeEscape {
    override method precioExtraXGenero() = 7000

    override method condicionExtraXGenero() {
        return true
    }
}

class SalaDeEscapeHistoria inherits SalaDeEscape {
    const basadaEnHistoriaReal

    override method precioExtraXGenero() = dificultad * 0.314

    override method condicionExtraXGenero() {
        return !basadaEnHistoriaReal 
    }
}

class SalaDeEscapeTerror inherits SalaDeEscape {
    var cantSustos

    method cantidadDeSustosMayorA(unaCant) {
        return cantSustos > unaCant
    }

    override method precioExtraXGenero() {
        if(self.cantidadDeSustosMayorA(5)) {
            return cantSustos * 0.2
        } else {
            return 0
        }
    }

    override method condicionExtraXGenero() {
        return self.cantidadDeSustosMayorA(5)
    }
}