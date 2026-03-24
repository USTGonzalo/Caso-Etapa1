package Conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

public class BasedeDatos {

    //Datos para el ingreso
    String bd = "hiratadb";
    String url = "jdbc:mysql://localhost:3306/";
    String user = "root";
    String password = "root";
    String driver = "com.mysql.cj.jdbc.Driver";
    Connection cx = null;

    //Realizar la conexión a la base de datos MYSQL
    public Connection conectar() {
        try {
            Class.forName(driver);
            cx = DriverManager.getConnection(
                url + bd + "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC",
                user,
                password
            );
            System.out.println("Se conectó de forma exitosa a " + bd);
        } catch (ClassNotFoundException | SQLException ex) {
            //System.out.println("No se logró la conexión a " + bd);
            JOptionPane.showMessageDialog(null, "No se logró la conexión a " + bd);
            Logger.getLogger(BasedeDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cx;
    }
    
    //Realizar desconexión de la base de datos MYSQL
    public void desconectar() {
        try {
            if (cx != null && !cx.isClosed()) {
                cx.close();
                System.out.println("Desconexión realizada con éxito");
            } else {
                JOptionPane.showMessageDialog(null, "No hay conexión activa");
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error al cerrar la conexión");
        }
    }
}