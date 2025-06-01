import profesionales.*
import empresas.*

class Persona {
  var property provinciaDondeVive
  
  method puedeSerAtendidoPor(
    unProfesional
  ) = unProfesional.trabajaEn().contains(self.provinciaDondeVive())
}

class Institucion {
  const universidadesQueReconoce = #{}
  
  method agregarUniversidad(unaUniversidad) {
    universidadesQueReconoce.add(unaUniversidad)
  }
  
  method quitarUniversidad(unaUniversidad) {
    universidadesQueReconoce.remove(unaUniversidad)
  }
  
  method puedeSerAtendidoPor(unProfesional) = universidadesQueReconoce.contains(
    unProfesional.universidadQueEstudio()
  )
}

class Club {
  const provincias = #{}
  
  method agregarProvincia(unaProvincia) {
    provincias.add(unaProvincia)
  }
  
  method quitarProvincia(unaProvincia) {
    provincias.remove(unaProvincia)
  }
  
  //si la interseccion de los 2 conjuntos no es VACIA, tienen una provincia en comun
  method puedeSerAtendidoPor(unProfesional) = not provincias.intersection(
    unProfesional.trabajaEn()
  ).isEmpty()
}