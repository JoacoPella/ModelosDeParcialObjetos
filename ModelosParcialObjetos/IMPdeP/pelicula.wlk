import artista.*
import impdp.*
class Pelicula {
    const nombre 
    const elenco = #{}

    method nombre() {
        return nombre
    }

    //Presupuesto de la pelicula.
    method presupuesto() {
        return self.sumaDeSueldosDeElenco() * 1.7 
    }

    //Suma de sueldos de elenco.
    method sumaDeSueldosDeElenco() {
        return elenco.sum({ artista => artista.sueldo() })
    }

    //Ganacias de la peliculas.
    method ganacias() {
        return self.recaudacionTotal() - self.presupuesto()
    }

    method recaudacionBase() {
        return 1000000 
    }

    method recaudacionTotal() {
        return self.recaudacionBase() + self.extraPorGenero()
    }

    method extraPorGenero()

    method rodar() {
        elenco.forEach({ artista => artista.actuar() })
    }

    method esEconomica() {
        return self.presupuesto() < 500000
    }
}

class PeliculaDeDrama inherits Pelicula {

    override method extraPorGenero() {
        return 100000 * nombre.size()
    }
}

class PeliculaDeAccion inherits Pelicula {
    var vidriosRotos

    override method presupuesto() {
        return super() + 1000 * vidriosRotos
    }

    override method extraPorGenero() {
        return 50000 * elenco.size()
    }
}

class PeliculaDeTerror inherits Pelicula{
    var cantCuchillos

    override method extraPorGenero() {
        return 20000 * cantCuchillos
    }
}

class PeliculaDeComedia inherits Pelicula {
    
    override method extraPorGenero() {
        return 0
    }
}