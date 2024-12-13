class Banda {
    const nombre
    const canon = 1000000

    method nombre() = nombre

    method canon() = canon

    method presupuesto() = self.canon() + self.gastosExtras()

    method gastosExtras()

    method popularidad() 
}

class BandaDeRock inherits Banda {
    const solosDeGuitarra 

    override method gastosExtras() = 10000

    override method popularidad() = 100 * solosDeGuitarra
}

class BandaTrap inherits Banda {
    const tieneIce // bool

    override method gastosExtras() = 0

    override method popularidad() {
        if(tieneIce){
            return 1000
        }
        else{
            return 0
        }
    }

    override method canon() = super() * self.popularidad()
}

class BandaIndies inherits Banda {
    const cantInstrumentos
    
    override method gastosExtras() = 500 * cantInstrumentos

    override method popularidad() = 3.14 * self.nombre().size()
}

