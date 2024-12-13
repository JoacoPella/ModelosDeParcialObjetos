import Productora.*
import Banda.*

class Entrada {
    const fecha = new Date()

    method precio() =  1000

    method nombreBanda() = Banda.nombre()
    

    method precioConImpuestos() = self.precio() * (1 - productora.impuesto())

    method esDelAnioPasado(){
        const hoy = new Date()
        return hoy.year() - fecha.year() == 1
    }
}