package modelo.dtos;

/** 
 * @author Kennit David Ruz Romero
 * Hora de creación: 11:18 a.m.
 * Fecha: 4 de Marzo de 2015
 */

public class RolDto {
    private int idRol = 0;
    private String nombre = "";
    private String descripcion = "";
    private int estado = 0;

    @Override
    public String toString() {
        return "RolDto{" + "idRol=" + idRol + ", nombre=" + nombre + ", descripcion=" + descripcion + ", estado=" + estado + '}';
    }



    /**
     * @return the idRol
     */
    public int getIdRol() {
        return idRol;
    }

    /**
     * @param idRol the idRol to set
     */
    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * @return the estado
     */
    public int getEstado() {
        return estado;
    }

    /**
     * @param estado the estado to set
     */
    public void setEstado(int estado) {
        this.estado = estado;
    }
}
