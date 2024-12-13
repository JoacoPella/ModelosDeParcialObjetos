import nivel.*
import noPuedeAgregarAlCarritoException.NoPuedeAgregarAlCarritoException
import cupon.Cupon


class Usuario {
  const nombre
  var dineroDisponible 
  var puntos
  var nivel = bronce

  const carrito = []
  const cupones = [] 

    method agregarAlCarrito(unProducto) {
        if(nivel.puedeAgregarAlCarrito(carrito.size())){
            carrito.add(unProducto)
        }
        else {
            throw new noPuedeAgregarAlCarritoException.NoPuedeAgregarAlCarritoException()
        }
    }

    method comprarCarrito(){
        const cupon = self.cuponDisponible()
        cupones.usarCupon()
        const precioAPagar = cupon.precioConDescuentoAplicado(self.precioDelCarrito())
        dineroDisponible -= precioAPagar
        self.sumarPuntos(precioAPagar)
    }

    method cuponDisponible(){
        return cupones.filter( {unCupon => unCupon.estaDisponible()}).anyOne()
    }

    method precioDelCarrito(){
        return carrito.sum( {unProducto => unProducto.precioFinal()} )
    }

    method sumarPuntos(unPrecio){
        puntos += (unPrecio * 0.1)
    }

    method esMoroso() = dineroDisponible < 0

    method penalizar(){
        puntos -= 1000
    }

    method eliminarCuponesUsados(){
        cupones.removeAllSuchThat( {unCupon => !unCupon.estaDisponible()} )
    }

    method actualizarNivel(){
        nivel = self.nivelCorrespondiente()
    }

    method nivelCorrespondiente(){
        if(puntos < 1000) return bronce
        if(puntos < 5000) return plata
        return oro
    }
}