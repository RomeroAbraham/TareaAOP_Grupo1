package tarea_espol.aop;

public aspect AspectoAdapter {

    
    pointcut interceptarLogin(String tokenInput) : 
        call(void tarea_espol.aop.Autenticador.login(String)) && args(tokenInput);

    
    void around(String tokenInput) : interceptarLogin(tokenInput) {
        
        System.out.println("[AspectoAdapter] Interceptando intento de login...");
        String correoValidado = tokenInput;

       
        if (tokenInput != null && tokenInput.startsWith("TOKEN_")) {
            String usuario = tokenInput.substring(6); // Elimina "TOKEN_"
            
            
            correoValidado = usuario + "@espol.edu.ec";
            System.out.println("[AspectoAdapter] Se detectó un token de Google. Adaptando a correo: " + correoValidado);
        } else {
            System.out.println("[AspectoAdapter] Credencial estándar detectada. Procediendo sin cambios.");
        }

        
        proceed(correoValidado);
    }
}