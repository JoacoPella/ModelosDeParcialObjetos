object ilimitado {

	method vencido() = false

}

class Vencimiento {

	const fecha

	method vencido() = fecha < new Date()

}