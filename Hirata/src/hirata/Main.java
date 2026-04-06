package hirata;
import windows.Login;

public class Main {

    //Admin false para iniciar
    private static boolean isAdmin = false;
    private static int userId = -1;
    public static void main(String[] args) {
        //Iniciar el login
        Login login = new Login(isAdmin, userId);
        login.setVisible(true);
        login.setLocationRelativeTo(null); // centra la ventana
    }
}