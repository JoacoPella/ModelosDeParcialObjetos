import Noticias.*

class Periodista {
    const fechaDeingreso = new Date()
    const noticiasPublicadas = []

    method esDePreferencia(unaNoticia)

    method publicarNoticia(unaNoticia){
        self.puedePublicar(unaNoticia)
        unaNoticia.estaBienEscrita()
        noticiasPublicadas.add(unaNoticia)
    }
    
    method noticiasQueNoPrefiere(){
        return noticiasPublicadas.filter({ noticia => !self.esDePreferencia(noticia) })
    }

    method puedePublicar(unaNoticia){
        self.esDePreferencia(unaNoticia) || self.cantidadDeNoticiasPublicadasNoPreferentesHoy() < 2
    }

    method cantidadDeNoticiasPublicadasNoPreferentesHoy(){
        const hoy = new Date()
        return self.noticiasQueNoPrefiere().filter({ noticias => noticias.fechaDePublicacion() == hoy }).size()
    }

    method tuvoActividadReciente(){
        const hoy = new Date()
        self.fechaDeLaUltimaPublicacion().between(hoy.minusDays(7), hoy)
    }

    method fechaDeLaUltimaPublicacion(){
        return noticiasPublicadas.last().fechaDePublicacion()
    }

    method esNovato(){
        const hoy = new Date()
        fechaDeingreso.between(hoy.minusYear(1), hoy)
    }
}

class PeriodistaCopado inherits Periodista {
    override method esDePreferencia(unaNoticia) {
        unaNoticia.esCopada()
    }
}

class PeriodistaSensacional inherits Periodista {
    override method esDePreferencia(unaNoticia) {
        unaNoticia.esSensacional()
    }
}

class Vago inherits Periodista {
    override method esDePreferencia(unaNoticia) {
        unaNoticia.vaga() || unaNoticia == Chivo
    }
}

object joseDeZer inherits Periodista {

    override method esDePreferencia(unaNoticia) {
        unaNoticia.titulo().head() == "T"
    }
} 