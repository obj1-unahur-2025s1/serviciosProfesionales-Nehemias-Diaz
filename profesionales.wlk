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
}

class ProfesionalesAsociadosAlLitoral {
  var universidadQueEstudio
  
  method universidadQueEstudio() = universidadQueEstudio
  
  method universidadQueEstudio(unaUniversidad) {
    universidadQueEstudio = unaUniversidad
  }
  
  method honorariosPorHora() = 3000
  
  method trabajaEn() = #{"Entre Rios", "Santa Fe", "Corrientes"}
}

class ProfesionalesLibres {
  var property universidadQueEstudio
  var property honorariosPorHora
  const trabajaEn = #{}
  
  method trabajaEn() = trabajaEn
  
  method agregarProvincia(unaProvincia) {
    trabajaEn.add(unaProvincia)
  }
  
  method quitarProvincia(unaProvincia) {
    trabajaEn.remove(unaProvincia)
  }
}