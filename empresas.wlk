import profesionales.*
import universidad.*
import solicitantes.*


class Empresa {
  const profesionalesContratados = []
  var property honorariosDeReferencia
  
  method contratarProfesional(unProfesional) {
    profesionalesContratados.add(unProfesional)
  }
  
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
  
  //ETAPA 2 !!!!!!!!!!!!!!!!!!!
  method puedeSatisfacerA(unSolicitante) = profesionalesContratados.any(
    { p => unSolicitante.puedeSerAtendidoPor(p) }
  )
}