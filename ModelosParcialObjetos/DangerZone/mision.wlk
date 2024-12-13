import empleado.*
import equipo.*
class Mision {
    const habilidadesRequeridas = #{}
    const peligrosidad 

    method serCumplida(asignado) {
        if(not self.reuneHabilidadesRequeridas(asignado)) {
            self.error("No se puede realizar la misión por falta de habilidades")
        }

        asignado.recibirDanio(peligrosidad)

        asignado.finalizarMision(self)
    }

    method reuneHabilidadesRequeridas(asignado) = habilidadesRequeridas.all {habilidad => asignado.puedeUsar(habilidad)}

    method enseniarHabilidades(empleado) {
        self.habilidadesQueNoTiene(empleado) . forEach({habilidad => empleado.aprenderHabilidad(habilidad)})
    }
    method habilidadesQueNoTiene(empleado) = habilidadesRequeridas . filter {habilidad => not empleado.poseeHabilidad(habilidad)}
}