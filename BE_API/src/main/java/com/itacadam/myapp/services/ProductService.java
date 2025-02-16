package com.itacadam.myapp.services;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itacadam.myapp.api.requests.ProductCreationRequest;
import com.itacadam.myapp.models.Product;
import com.itacadam.myapp.repository.ProductRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


@Service
public class ProductService {
    private static final Logger logger = LoggerFactory.getLogger(ProductService.class);

    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public Product createProduct(ProductCreationRequest productCreationRequest) {
        return productRepository.save(mapToProduct(productCreationRequest));
    }

    public void removeProduct(Long id) {
        productRepository.deleteById(id);
    }

    private Product mapToProduct(ProductCreationRequest createRequest) {
        Product product = new Product();
        product.setNombre(createRequest.nombre());
        product.setDescripcion(createRequest.descripcion());
        product.setImagenPath(createRequest.imagenPath());
        product.setStock(createRequest.stock());
        product.setPrecio(createRequest.precio());
        return product;
    }

    public Optional<Product> getProduct(final long id) {
        return productRepository.findById(id);
    }

    public List<Product> getAllProducts() {
        try {
            return productRepository.findAll();
        } catch (Exception e) {
            logger.error("Error en listado de productos {}", e.getMessage());
            return new ArrayList<>(); // Devuelve una lista vacía en caso de error
        }
    }

}