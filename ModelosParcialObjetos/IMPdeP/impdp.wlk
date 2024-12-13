import artista.*
import pelicula.*

class Impdp {
    var artistas = #{}
    var peliculas = #{}

    method artistaMejorPago() {
        return artistas.max({ unArtista => unArtista.sueldo() })
    }

    method peliculasEconomicas() {
        return peliculas.filter({ unaPelicula => unaPelicula.esEconomica() })
    }

    method nombrePeliculasEconomicas() {
        return self.peliculasEconomicas().map({ unaPelicula => unaPelicula.nombre() })
    }

    method sumaDeGanaciasDePeliculasEconomicas() {
        return self.peliculasEconomicas().sum({ unaPelicula => unaPelicula.ganacias() })
    }

    method recategorizarArtistas() {
        artistas.forEach({ unArtista => unArtista.recategorizarArtista() })
    }
}