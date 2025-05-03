object neo {
    var energia = 100
    
    method vitalidad() = energia * 0.1
    method esElElegido() = true 
    method saltar() {
      energia -= energia / 2
    }
}


object morfeo {
    var  vitalidad = 8 
    var estaDescansado = true 

    method vitalidad() = vitalidad
    method esElElegido() = false
    method saltar() {
      estaDescansado = not estaDescansado
      vitalidad = (vitalidad - 1).max(0)
    }
}

object trinity {

    method vitalidad() = 0
    method esElElegido() = false
    method saltar(){}
}

object nave {
    const pasajeros = #{}

    method cantPasajeros() =  pasajeros.size()
    method pasajeroDeManorVitalidad() = pasajeros.min({p=>p.vitalidad()})
    method pasajeroDeMayorVitalidad() = pasajeros.max({p=>p.vitalidad()})
    method estaEquilibrada(){
        return self.pasajeroDeMayorVitalidad().vitalidad()<
               self.pasajeroDeManorVitalidad().vitalidad()*2
    }
    method estaElElejido() = pasajeros.any({p=>p.esElElegido()}) 
    method chocar() {
        pasajeros.forEach({p=>p.saltar()})
        pasajeros.clear()
    } 
    method acelerar(){
        pasajeros.filter({p=>not p.esElElegido()}).forEach({p=>p.saltar()})
        pasajeros.remove(neo)   
    } 
}
  
