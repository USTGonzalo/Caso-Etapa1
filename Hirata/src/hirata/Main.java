package hirata;
import windows.Login;

public class Main {

    //Admin false para iniciar
    private static boolean inicio = false;
    public static void main(String[] args) {
        //Iniciar el login
        Login login = new Login(inicio);
        login.setVisible(true);
        login.setLocationRelativeTo(null); // centra la ventana
    }
}