import NoPuedeComprarEntradaPorFaltaDeSaldoException.NoPuedeComprarEntradaPorFaltaDeSaldoException


class Asistente {
    var tipoDeAbono // Vip o fan
    var historialDeEntradas = []
    var dineroDisp

    method comprarEntrada(unaEntrada) {
        if(dineroDisp > 0){
            self.pagarEntrada(unaEntrada) 
            self.agregarAlHistorial(unaEntrada)
        }
        else{
            throw new NoPuedeComprarEntradaPorFaltaDeSaldoException()
        }
    }

    method pagarEntrada(unaEntrada){
        dineroDisp = unaEntrada.precioConImpuestos() * (1 - tipoDeAbono.descuento())
    }

    method agregarAlHistorial(unaEntrada) {
        historialDeEntradas.add(unaEntrada)
    }

    method historialDeEntradasDelAnioPasado(unaEntrada){
        return historialDeEntradas.filter({ unaEntrada => unaEntrada.esDelAnioPasado() })
    }

    method historialDeEntradasPorNombre(unaEntrada){
        return historialDeEntradas.filter({ unaEntrada => unaEntrada.nombreBanda() })
    }

    method dineroTotalGastado() = historialDeEntradas.sum({ unaEntrada => unaEntrada.precioConImpuestos() })

    method cantidadDeCompradas() = historialDeEntradas.size()
}