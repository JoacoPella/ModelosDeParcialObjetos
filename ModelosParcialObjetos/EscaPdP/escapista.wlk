import salaDeEscape.*

class Escapista {
    var maestria
    var saldo
    var salasSuperadas = []


    //Puede escapar de una sala.
    method puedeEscaparDe(unaSala) {
        return maestria.puedeEscaparDe(unaSala, self)
    }

    //Escapó de muchas salas.
    method escapoDeMuchasSalas(){
        return salasSuperadas.size() >= 6
    }

    //Subir nivel de maestría.
    method subirNivelDeMaestria(){
        if(maestria.puedeSubirDeNivel() && self.escapoDeMuchasSalas()){
            maestria = profesional
        }
    }

    //Nombre de las sala de las que escapo.
    method nombreDeSalasSuperadas(){
        return salasSuperadas.asSet({ unaSala => unaSala.nombre() })
    }

    //Registrar sala superada.
    method registrarSalaSuperada(unaSala){
        salasSuperadas.add(unaSala)
    }

    //Pagar sala. 
    method pagarSala(unPrecio){
        saldo -= saldo
    }

    //Getter de saldo. 
    method saldo(){
        return saldo
    }
}

object amateur {

    //Puede escapar de una sala.
    method puedeEscaparDe(unaSala, unEscapista) {
        return unaSala.noEsDificil() && unEscapista.escapoDeMuchasSalas()
    }

    //Puede subir de nivel.
    method puedeSubirDeNivel() {
        return true
    }
}

object profesional {

    //Puede escapar de una sala.
    method puedeEscaparDe(unaSala, unEscapista){
        return true
    }

    //Puede subir de nivel.
    method puedeSubirDeNivel() {
        return false
    }
}