class Cupon{
    var fueUsado = false
    const descuento

    method estaDisponible(){
        return !fueUsado
    }

    method descuento() = descuento

    method precioConDescuentoAplicado(unPrecio){
        return unPrecio * (1 - descuento)
    }

    method usarCupon(){
        fueUsado = true
    }
}