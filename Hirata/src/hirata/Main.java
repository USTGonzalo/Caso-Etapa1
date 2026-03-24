package hirata;
import windows.Login;

public class Main {

    public static void main(String[] args) {
        //Iniciar el login
        Login login = new Login();
        login.setVisible(true);
        login.setLocationRelativeTo(null); // centra la ventana
    }
}