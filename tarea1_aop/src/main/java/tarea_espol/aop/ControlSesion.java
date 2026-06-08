package tarea_espol.aop;


public class ControlSesion {
    
    private String estadoSesion;

    public ControlSesion() {
        System.out.println("Ejecutando constructor de ControlSesion...");
        this.estadoSesion = "Sesión Activa";
    }

    public String getEstadoSesion() {
        return estadoSesion;
    }

    public void setEstadoSesion(String estadoSesion) {
        this.estadoSesion = estadoSesion;
    }
}
