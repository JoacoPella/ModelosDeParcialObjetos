object productora {
    var impuesto = 0
    const asistentes = #{}
    const bandas = #{}

    method impuesto(nuevoImpuesto){
        impuesto = nuevoImpuesto
    }

    method impuesto() = impuesto

    method gananciaTotal(){
        return asistentes.sum({ asistente => asistente.gananciaPorAsistente() }) - self.presupuestoDeBandas()
    }

    method gananciaPorAsistente() = asistentes.filter({ asistente => asistente.dineroTotalGastado() })

    method presupuestoDeBandas() = bandas.sum({ banda => banda.presupuesto() })

    method cantidadDeEntradasVendidas() = asistentes.sum({ asistente => asistente.cantidadDeCompradas() })

    method bandaMasPopular() = bandas.max({ banda => banda.popularidad() })
}