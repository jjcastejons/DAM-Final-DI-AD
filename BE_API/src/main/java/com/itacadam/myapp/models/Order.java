package com.itacadam.myapp.models;

import jakarta.persistence.*;

import java.util.Objects;


/*
 *   final int numeroPedido;
  final String descripcion;
  final double precio;
  String estado;
  final String comprador;
 * 
 */

@Entity
@Table(name = "ORDERS")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "numeroPedido")
    private Long numeroPedido;

    @Column(name = "descripcion")
    private String descripcion;

    @Column(name = "precio")
    private double precio;

    @Column(name = "estado")
    private String estado;

    @Column(name = "comprador")
    private String comprador;

    
    public Long getNumeroPedido() {
        return numeroPedido;
    }

    public void setNumeroPedido(Long numeroPedido) {
        this.numeroPedido = numeroPedido;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getComprador() {
        return comprador;
    }

    public void setComprador(String comprador) {
        this.comprador = comprador;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((numeroPedido == null) ? 0 : numeroPedido.hashCode());
        result = prime * result + ((descripcion == null) ? 0 : descripcion.hashCode());
        long temp;
        temp = Double.doubleToLongBits(precio);
        result = prime * result + (int) (temp ^ (temp >>> 32));
        result = prime * result + ((estado == null) ? 0 : estado.hashCode());
        result = prime * result + ((comprador == null) ? 0 : comprador.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Order other = (Order) obj;
        if (numeroPedido == null) {
            if (other.numeroPedido != null)
                return false;
        } else if (!numeroPedido.equals(other.numeroPedido))
            return false;
        if (descripcion == null) {
            if (other.descripcion != null)
                return false;
        } else if (!descripcion.equals(other.descripcion))
            return false;
        if (Double.doubleToLongBits(precio) != Double.doubleToLongBits(other.precio))
            return false;
        if (estado == null) {
            if (other.estado != null)
                return false;
        } else if (!estado.equals(other.estado))
            return false;
        if (comprador == null) {
            if (other.comprador != null)
                return false;
        } else if (!comprador.equals(other.comprador))
            return false;
        return true;
    }

   

    

}