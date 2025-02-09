package com.itacadam.myapp.api.requests;


public record ProductCreationRequest(String nombre, String descripcion, String imagenPath, int stock, double precio) {
}
