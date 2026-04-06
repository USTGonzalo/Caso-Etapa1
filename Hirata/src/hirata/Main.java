package hirata;
import windows.Login;

public class Main {

    private static boolean isAdmin = false;
    public static void main(String[] args) {
        //Iniciar el login
        
        Login login = new Login(isAdmin);
        login.setVisible(true);
        login.setLocationRelativeTo(null); // centra la ventana
    }
}