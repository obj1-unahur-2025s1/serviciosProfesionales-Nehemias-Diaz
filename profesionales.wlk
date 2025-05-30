import empresas.*
import universidad.*

class ProfesionalesVinculados {
  var property universidadQueEstudio
  
  method honorariosPorHora() = universidadQueEstudio.honorariosPorHora()
  
  method trabajaEn() = #{universidadQueEstudio.provincia()}
}

class ProfesionalesAsociadosAlLitoral {
  var property universidadQueEstudio
  
  method honorariosPorHora() = 3000
  
  method trabajaEn() = #{"Entre Rios", "Santa Fe", "Corrientes"}
}

class ProfesionalesLibres {
  var property universidadQueEstudio
  var property honorariosPorHora
  var property trabajaEn
}