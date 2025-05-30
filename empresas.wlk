import profesionales.*
import universidad.*

class Empresa {
  const profesionalesContratados = []
  var property honorariosDeReferencia
  
  method contratarProfesional(unProfesional) {
    profesionalesContratados.add(unProfesional)
  }

  method profesionalesContratados() = profesionalesContratados
  
  method cuantosEstudiaronEn(unaUniversidad) = profesionalesContratados.count(
    { p => p.universidadQueEstudio() == unaUniversidad }
  )
  
  method profesionalesCaros() = profesionalesContratados.filter(
    { p => p.honorariosPorHora() > self.honorariosDeReferencia() }
  ).asSet()
  
  method universidadesFormadoras() = profesionalesContratados.map(
    { p => p.universidadQueEstudio() }
  ).asSet()
  
  method profesionalMasBarato() = profesionalesContratados.min(
    { p => p.honorariosPorHora() }
  )
  
  method esDeGenteAcotada() = profesionalesContratados.all(
    { p => p.trabajaEn().size() <= 3 }
  )
}