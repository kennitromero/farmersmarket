package modelo.daos;

/**
 * @author Kennit David Ruz Romero 
 * Fecha: 4 de de Enero de 2015
 */
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.dtos.DepartamentoDto;
import modelo.utilidades.Conexion;

public class TelefonoDao {

    private Connection miCon = null;
    PreparedStatement pstm = null;
    int rtdo;
    ResultSet rs = null;
    String mensaje = "";
    String sqlTemp = "";

    public TelefonoDao() {
        miCon = Conexion.getInstance();
    }
    
    public String insertTelefono(int idUsuario, int nuevoNumero) {
        try {
            String sqlInsert = "INSERT INTO `telefonos`(`idUsuario`, `Numero`) VALUES (?, ?)";
            pstm = miCon.prepareStatement(sqlInsert);

            pstm.setInt(1, idUsuario);
            pstm.setInt(2, nuevoNumero);
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
    
    public List obtenerTelefonosPorId(int idUsuario) {
        ArrayList<DepartamentoDto> departamentos = null;
        sqlTemp = "SELECT `Numero` FROM `telefonos` WHERE `idUsuario` = ?";
        try {
            pstm = miCon.prepareStatement(sqlTemp);
            pstm.setInt(1, idUsuario);
            rs = pstm.executeQuery();
            
            departamentos = new ArrayList();
            while (rs.next()) {
                DepartamentoDto temp = new DepartamentoDto();
                temp.setIdDepartamento(rs.getInt("idDepartamento"));
                temp.setNombre(rs.getString("Nombre"));
                departamentos.add(temp);
            }
        } catch (SQLException ex) {
            System.out.println("Error, detalle: " + ex.getMessage());
        }
        return departamentos;
    }
    
    public String actualizarTelefono(int antiguoNumero, int nuevoNumero) {
        try {
            String sqlInsert = "UPDATE `telefonos` SET `Numero` = ? WHERE `Numero` = ?";
            pstm = miCon.prepareStatement(sqlInsert);

            pstm.setInt(1, nuevoNumero);
            pstm.setInt(2, antiguoNumero);
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
    
    public String eliminarTelefono(int numero) {
        try {
            String sqlInsert = "DELETE FROM `telefonos` WHERE `Numero` = ?";
            pstm = miCon.prepareStatement(sqlInsert);

            pstm.setInt(1, numero);
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
