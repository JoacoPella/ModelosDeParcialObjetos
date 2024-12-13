import salaDeEscape.*
import escapista.*
import NoPuedenPagarLaSalaPorSaldoInsuficienteException.NoPuedenPagarLaSalaPorSaldoInsuficienteException

class Grupo {
    var miembros = #{}

    //Pueden escapar.
    method puedenEscapar(unaSala){
        return miembros.any({ miembro => miembro.puedeEscaparDe(unaSala) })
    }

    //Pueden pagar la sala. 
    method puedenPagarLaSala(unaSala){
        return unaSala.precioTotal() <=miembros.sum({ miembro => miembro.saldo() })
    }

    //Pagar sala. 
    method pagarSala(unaSala){
        if(self.puedenPagarLaSala(unaSala)){
            miembros.forEach({ miembro => miembro.pagarSala(self.precioPorMiembro(unaSala)) })
        } else {
            throw new NoPuedenPagarLaSalaPorSaldoInsuficienteException()
        }
    }

    //Precio por miembro. 
    method precioPorMiembro(unaSala){
        return unaSala.precioTotal().div(miembros.size())
    }

    //Agregar sala al registro.
    method agregarSalaAlRegistro(unaSala){
        miembros.forEach({ miembro => miembro.registrarSalaSuperada(unaSala) })
    }

    //Escapar de Sala. 
    method escaparDe(unaSala){
        if(self.puedenPagarLaSala(unaSala)){
            self.pagarSala(unaSala)
            if(self.puedenEscapar(unaSala)){
                self.agregarSalaAlRegistro(unaSala)
            }
        }
    }
} 