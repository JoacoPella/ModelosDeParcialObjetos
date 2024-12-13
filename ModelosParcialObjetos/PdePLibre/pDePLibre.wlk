import usuario.Usuario

class pDePLibre {
    const productos = []
    const usuarios = #{}

    method penalizarMorosos(){
        self.usuariosMorosos().forEach( {unUsuario => unUsuario.penalizar()} )
    }

    method usuariosMorosos() = usuarios.filter( {unUsuario => unUsuario.esMoroso()} )

    method eliminarCuponesDeUsuarios(){
        usuarios.forEach( {unUsuario => unUsuario.eliminarCupones()} )
    }

    method nombreDeProductosDeOferta(){
        return productos.map( {unProducto => unProducto.nombreEnOferta()} )
    }

    method actualizarNivelDeUsuarios() = usuarios.forEach( {unUsuario => unUsuario.actualizarNivel()} )
}