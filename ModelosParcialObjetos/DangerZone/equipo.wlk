import empleado.*
class Equipo {
    const empleados = #{}

    method puedeUsar(habilidad) = 
        empleados.any ({empleado => empleado.puedeUsar(habilidad)})

    method recibirDanio(danio) =
        empleados.forEach({empleado => empleado.recibirDanio(danio)})

    method finalizarMision(mision) {
        empleados.forEach({empleado => empleado.finalizarMision(mision)})
    }
}