package com.itacadam.myapp.api.requests;

public record UserCreationRequest(String nombre, String contrasena, int edad, boolean administrador) {
}
