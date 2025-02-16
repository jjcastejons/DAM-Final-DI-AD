package com.itacadam.myapp.models;
import jakarta.persistence.*;

import java.util.Objects;

@Entity
@Table(name = "User")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "nombre")
    private String nombre;

    @Column(name = "contrasena")
    private String contrasena;

    @Column(name = "edad")
    private int edad;

    @Column(name = "administrador")
    private boolean administrador;


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User person = (User) o;
        return edad == person.edad && Objects.equals(id, person.id) && Objects.equals(nombre, person.nombre);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, nombre, contrasena, edad, administrador);
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

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getContrasena() {
        return contrasena;
    }    

    public boolean getAdministrador() {
        return administrador;
    }

    public void setAdministrador(boolean administrador) {
        this.administrador = administrador;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public User() {
    }



}
