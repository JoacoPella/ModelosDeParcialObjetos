class Noticia {
    const fechaDePublicacion = new Date()
    const autor
    const gradoDeImportancia // del 1 al 10
    const titulo
    const desarrollo

    method titulo() = titulo

    method fechaDePublicacion() = fechaDePublicacion

    method esImportante() = gradoDeImportancia >= 8

    method noticiaReciente() {
        const fecha = new Date()
        fecha.day() - fechaDePublicacion.day() < 3
    }

    method esCopada() {
        self.esImportante()
        self.noticiaReciente()
    }

    method esSensacional() {
        self.suTituloContiene(["espectacular", "increible", "grandioso"])
    }

    method suTituloContiene(unaLista) {
        unaLista.any({ palabra => titulo.contains(palabra) })
    }

    method vaga() {
        desarrollo.size() < 100
    }

    method estaBienEscrita() {
        self.cantidadDePalabras() > 1
        desarrollo != ""
    }

    method cantidadDePalabras() = desarrollo.split(" ").size()
}

class Articulo inherits Noticia {
    const links = []

    override method esCopada() {
        super() 
        links.size() > 1
    }
}

class Chivo inherits Noticia {
    const gananciaDelChivo // experasado en millones

    override method esCopada() {
        super() 
        gananciaDelChivo > 2
    }
} 

class Reportaje inherits Noticia {
    const entrevistado

    override method esCopada(){
        super()
        entrevistado.size().odd()
    }

    override method esSensacional() {
        super() 
        entrevistado == "Dibu Martinez"
    }
}

class Cobertura inherits Noticia {
    const noticiasRelacionadas = []

    override method esCopada() {
        super()
        noticiasRelacionadas.all({ noticia => noticia.esCopada() })
    }
}
