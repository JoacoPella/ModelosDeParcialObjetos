import vikingos.*

class Expedicion {
    const objetivos = #{}
    var cantVikingos

    method cantVikingos() {
        return cantVikingos
    }

    method expedicionQueValeLaPena() {
        objetivos.forEach({ objetivo => objetivo.valeLaPena() })
    }

    method subirVikingo(vikingo) {
        if(vikingo.puedeSubirAExpedicion(self)){
            cantVikingos += 1
        } else {
            throw new Exception(message = "El vikingo no puede subirse a la expedicion")
        }
    }

    method realizarExpedicion() {
        objetivos.forEach({ objetivo => objetivo.fueSaqueada() })
    }

    method calcularBotinExpedicion() {
        return objetivos.sum(objetivos.map({ objetivo => objetivo.calcularBotin() }))
    }

    method gananciaPorVikingo() {
        return self.calcularBotinExpedicion().div(cantVikingos)
    }

    method entregarGanaciaAlVikingo(vikingo) {
        vikingo.oro(self.gananciaPorVikingo())
    }
}