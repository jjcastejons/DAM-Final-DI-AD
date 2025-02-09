package com.itacadam.myapp.models;

import jakarta.persistence.*;

import java.util.Objects;

@Entity
@Table(name = "PRODUCT")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "nombre")
    private String nombre;

    @Column(name = "descripcion")
    private String descripcion;

    public String getDescripcion() {
        return descripcion;
    }


    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }


    public String getImagenPath() {
        return imagenPath;
    }


    public void setImagenPath(String imagenPath) {
        this.imagenPath = imagenPath;
    }


    public int getStock() {
        return stock;
    }


    public void setStock(int stock) {
        this.stock = stock;
    }


    public double getPrecio() {
        return precio;
    }


    public void setPrecio(double precio) {
        this.precio = precio;
    }

    @Column(name = "imagenPath")
    private String imagenPath;

    @Column(name = "stock")
    private int stock;

    @Column(name = "precio")
    private double precio;

    public Product(String nombre, String descripcion, String imagenPath, int stock, double precio) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.imagenPath = imagenPath;
        this.stock = stock;
        this .precio = precio;
    }
    

    public Product() {

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Product product = (Product) o;
        return Objects.equals(id, product.id) && Objects.equals(nombre, product.nombre);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, nombre);
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}