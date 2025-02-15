package com.itacadam.myapp.api.requests;


public record OrderCreationRequest(String descripcion, double precio, String estado, String comprador) {
}
