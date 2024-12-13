class Empleado {
    var property puesto
    var salud = 100
    const habilidades = #{}
    
    method estaIncapacitado() = salud < puesto.saludCritica()

    method puedeUsar(habilidad) = not self.estaIncapacitado() && self.poseeHabilidad(habilidad)

    method poseeHabilidad(habilidad) = habilidades.contains(habilidad)

    method recibirDanio(danio) {
         salud -= (danio*0.3)
    }

    method finalizarMision(mision) {
        if (salud > 0) {
            self.completarMision(mision)
        }
    }

    method completarMision(mision) {
        puesto.completarMision(mision, self)
    }

    method aprenderHabilidad(habilidad) = habilidades.add(habilidad)
}

class Jefe inherits Empleado {
    var subordinados

    override method poseeHabilidad(habilidad) = super(habilidad) || self.algunoDeSusSubordinadosLaUsa(habilidad)

    method algunoDeSusSubordinadosLaUsa(habilidad) = subordinados.any {subordinado => subordinado.puedeUsar(habilidad)}
}

object espia {
    method saludCritica() = 15

    method completarMision(mision, empleado){
        mision.enseniarHabilidades(empleado)
    }
}

class Oficinista {
    var cantidadDeEstrellas = 0

    method saludCritica() = 40 - 5 * cantidadDeEstrellas

    method completarMision(mision, empleado){
        cantidadDeEstrellas += 1
        if (cantidadDeEstrellas == 3) { 
            empleado.puesto(espia) 
            }
    }
}

