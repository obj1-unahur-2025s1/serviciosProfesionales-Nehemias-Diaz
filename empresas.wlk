import profesionales.*
import universidad.*
import solicitantes.*

//ETAPA 1 !!!!!!!!!!!!!!!!!!!!!!!!!!!!
class Empresa {
  const profesionalesContratados = #{}
  var property honorariosDeReferencia
  const clientes = #{}
  
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
  
  //ETAPA 4 !!!!!!!!!!!!!!!!!!!!!
  method darServicio(unSolicitante) {
    if (self.puedeSatisfacerA(unSolicitante)) {
      const profesionalQueAtiende = profesionalesContratados.filter(
        { p => unSolicitante.puedeSerAtendidoPor(p) }
      ).anyOne()
      profesionalQueAtiende.cobrarImporte(
        profesionalQueAtiende.honorariosPorHora()
      )
      clientes.add(unSolicitante)
    } else {
      self.error("No puede ser atendido")
    }
  }
  
  method cantidadClientes() = clientes.size()
  
  method tieneDeClienteA(unCliente) = clientes.contains(unCliente)
}