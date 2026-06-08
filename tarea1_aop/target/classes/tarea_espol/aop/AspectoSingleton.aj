package tarea_espol.aop;


public aspect AspectoSingleton {
    
    private ControlSesion instanciaUnica;

    pointcut creacionSesion(): call(ControlSesion.new());
    
    ControlSesion around(): creacionSesion() {
        if (instanciaUnica == null) {
            instanciaUnica = proceed();
            System.out.println("[Aspecto] Nueva instancia única generada en memoria.");
        } else {
            System.out.println("[Aspecto] Intercepción: Retornando la instancia única preexistente.");
        }
        return instanciaUnica;
    }
}
