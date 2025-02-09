package com.itacadam.myapp.services;


import org.springframework.stereotype.Service;

import com.itacadam.myapp.api.requests.ProductCreationRequest;
import com.itacadam.myapp.models.Product;
import com.itacadam.myapp.repository.ProductRepository;


import java.util.List;
import java.util.Optional;


@Service
public class ProductService {


    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public Product createProduct(ProductCreationRequest productCreationRequest) {
        return productRepository.save(mapToProduct(productCreationRequest));
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
        return productRepository.findAll();
    }

}