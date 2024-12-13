import impdp.*
import pelicula.*

class Artista {
    var categoria
    var cantPeliculasRealizadas
    var ahorros

    method sueldo() {
        return categoria.sueldoSegunCategoria(self)
    }

    method nivelDeFama() {
        return cantPeliculasRealizadas.div(2)
    }

    method actuar() {
        cantPeliculasRealizadas += 1
        ahorros += self.sueldo()
    }

    method recategorizarArtista() {
        categoria.recategorizar(self)
    }
}

object amateur {

    method sueldoSegunCategoria(unArtista) = 10000

    method recategorizar(unArtista) {
        if(unArtista.cantPeliculasRealizadas() > 10){
            return unArtista.categoria(establecido)
        } else {
            return unArtista
        }
    }
}

object establecido {

    method sueldoSegunCategoria(unArtista) {
        if(unArtista.nivelDeFama() < 15){
            return 15000
        } else {
            return 5000 * unArtista.nivelDeFama()
        }
    }
    
    method recategorizar(unArtista) {
        if(unArtista.nivelDeFama() > 10){
            return unArtista.categoria(estrella)
        } else {
            return unArtista
        }
    }
}

object estrella {

    method sueldoSegunCategoria(unArtista) {
        return 30000 * unArtista.cantPeliculasRealizadas()
    }

    method recategorizar(unArtista) {
        throw new Exception(message ="No se puede recategorizar un estrella")
    }
}

