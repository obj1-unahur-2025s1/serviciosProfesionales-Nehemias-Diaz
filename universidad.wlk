import empresas.*
import profesionales.*
import solicitantes.*

class Universidad {
  var property provincia
  var property honorariosPorHora
  var donacionesRecibidas = 0
  
  method recibirDonacion(unaDonacion) {
    donacionesRecibidas += unaDonacion
  }

  method donacionesRecibidas() = donacionesRecibidas
}