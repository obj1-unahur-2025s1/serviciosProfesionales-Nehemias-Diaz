import empresas.*
import universidad.*
import solicitantes.*

class ProfesionalesVinculados {
  var universidadQueEstudio
  
  method universidadQueEstudio() = universidadQueEstudio
  
  method universidadQueEstudio(unaUniversidad) {
    universidadQueEstudio = unaUniversidad
  }
  
  method honorariosPorHora() = universidadQueEstudio.honorariosPorHora()
  
  method trabajaEn() = #{universidadQueEstudio.provincia()}
  
  method cobrarImporte(unImporte) {
    universidadQueEstudio.recibirDonacion(unImporte / 2)
  }
}

class ProfesionalesAsociadosAlLitoral {
  var universidadQueEstudio
  
  method universidadQueEstudio() = universidadQueEstudio
  
  method universidadQueEstudio(unaUniversidad) {
    universidadQueEstudio = unaUniversidad
  }
  
  method honorariosPorHora() = 3000
  
  method trabajaEn() = #{"Entre Rios", "Santa Fe", "Corrientes"}
  
  method cobrarImporte(unImporte) {
    asociacionProfesionalesDelLitoral.recibirDonacion(unImporte)
  }
}

object asociacionProfesionalesDelLitoral {
  var totalRecibido = 0
  
  method recibirDonacion(unaDonacion) {
    totalRecibido += unaDonacion
  }

  method donacionesRecibidas() = totalRecibido
}

class ProfesionalesLibres {
  var property universidadQueEstudio
  var property honorariosPorHora
  const trabajaEn = #{}
  var totalRecaudado = 0
  
  method trabajaEn() = trabajaEn
  
  method agregarProvincia(unaProvincia) {
    trabajaEn.add(unaProvincia)
  }
  
  method quitarProvincia(unaProvincia) {
    trabajaEn.remove(unaProvincia)
  }
  
  method cobrarImporte(unImporte) {
    totalRecaudado += unImporte
  }
  
  method pasarDineroA(unProfesional, unaCantidad) {
    totalRecaudado -= unaCantidad.min(totalRecaudado)
    unProfesional.cobrarImporte(unaCantidad)
  }

  method totalRecaudado() = totalRecaudado
}