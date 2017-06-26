/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.model;

/**
 *
 * @author SONY
 */
public class Modelo_plancontable {

    public int getIdplancontable() {
        return idplancontable;
    }

    public void setIdplancontable(int idplancontable) {
        this.idplancontable = idplancontable;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

  
    private int idplancontable;
    private String codigo;
    private String descripcion;
}
