class NivelLimitado {
    var limite

    method puedeAgregarAlCarrito(unaCantidad) {
        return unaCantidad < limite
    }
}

const bronce = new NivelLimitado(limite = 1)
const plata = new NivelLimitado(limite = 5)

object oro{
    method puedeAgregarAlCarrito(unaCantidad) {
        return true
    }
}