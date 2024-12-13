import vigencias.*
import consumos.*

class Pack {
    const vigencia = ilimitado
    method esInutil() = vigencia.vencido() || self.acabado()
    method acabado()
    method puedeSatisfacer(consumo) = not vigencia.vencido() && self.cubre(consumo)
    method cubre(consumo)
}

class PackConsumible inherits Pack {
    const property cantidad
    const consumos = []

    method consumir(consumo){
        consumos.add(consumo)
    }
    method cantidadConsumida() = consumos.sum( {consumo => consumo.cantidad()} )
    method remanente() = cantidad - self.cantidadConsumida()

	override method acabado() = self.remanente() <= 0
}

class Credito inherits PackConsumible {
    override method cubre(consumo) = consumo.costo() <= self.remanente()
}

class MBLibres inherits PackConsumible {
    override method cubre(consumo) = consumo.cubiertoPorInternet(self)
    method puedeGastarMB(cantidad) = cantidad <= self.remanente()
}

class MBLibrePlus inherits MBLibres {
    override method puedeGastarMB(cantidad) = super(cantidad) || cantidad < 0.1 
}

class PackIlimitado inherits Pack {
    method consumir(consumo){}
    override method acabado() = false
    method puedeGastarMB(cantidad) = true
    method puedeGastarMinutos(cantidad) = true
}

class LLamadasGratis inherits PackIlimitado {
    override method cubre(consumo) = consumo.cubiertoPorLlamadas(self)
}

class InternetLibreLosFindes inherits PackIlimitado {
    override method cubre(consumo) = consumo.cubiertoPorInternet(self) && consumo.fechaRealizado().internalDayOfWeek() > 5
}