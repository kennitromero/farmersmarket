package modelo.daos;

/**
 * @author Kennit Romero
 */
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.dtos.ContactoDto;
import modelo.utilidades.Conexion;

public class ContactoDao {

    private Connection miCon = null;
    PreparedStatement pstm = null;
    int rtdo;
    ResultSet rs = null;
    String mensaje = "";
    String sqlTemp = "";

    public ContactoDao() {
        miCon = Conexion.getInstance();
    }

    public String insertContactenos(ContactoDto nuevoContactenos) {
        try {
            String sqlInsert = "INSERT INTO `contactenos`(`idContacto`, `NombreCompleto`, `Correo`, `Mensaje`, `FechaRegistro`) VALUES (null, ?, ?, ?, now())";
            pstm = miCon.prepareStatement(sqlInsert);

            pstm.setString(1, nuevoContactenos.getNombreCompleto());
            pstm.setString(2, nuevoContactenos.getCorreo());
            pstm.setString(3, nuevoContactenos.getMensaje());
            rtdo = pstm.executeUpdate();

            if (rtdo != 0) {
                mensaje = "ok";
            } else {
                mensaje = "okno";
            }
        } catch (SQLException sqle) {
            mensaje = "Error, detalle " + sqle.getMessage();
        }
        return mensaje;
    }

    public List obtenerContactenos() {
        ArrayList<ContactoDto> mensajesContactenos = null;
        sqlTemp = "SELECT `idContacto`, `NombreCompleto`, `Correo`, `Mensaje`, `FechaRegistro` FROM `contactenos`";
        try {
            pstm = miCon.prepareStatement(sqlTemp);
            rs = pstm.executeQuery();

            mensajesContactenos = new ArrayList();
            while (rs.next()) {
                ContactoDto temp = new ContactoDto();
                temp.setIdContacto(rs.getInt("idContacto"));
                temp.setNombreCompleto(rs.getString("NombreCompleto"));
                temp.setCorreo(rs.getString("Correo"));
                temp.setMensaje(rs.getString("Mensaje"));
                temp.setFechaRegistro(rs.getString("FechaRegistro"));
                mensajesContactenos.add(temp);
            }
        } catch (SQLException ex) {
            System.out.println("Error, detalle: " + ex.getMessage());
        }
        return mensajesContactenos;
    }

    public String eliminarContactenos(int idContacto) {
        try {
            String sqlInsert = "DELETE FROM `contactenos` WHERE `idContacto` = ?";
            pstm = miCon.prepareStatement(sqlInsert);

            pstm.setInt(1, idContacto);
            rtdo = pstm.executeUpdate();

            if (rtdo != 0) {
                mensaje = "ok";
            } else {
                mensaje = "okno";
            }
        } catch (SQLException sqle) {
            mensaje = "Error, detalle " + sqle.getMessage();
        }
        return mensaje;
    }

}
