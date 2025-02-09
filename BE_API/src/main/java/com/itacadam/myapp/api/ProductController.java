package com.itacadam.myapp.api;

import org.springframework.web.bind.annotation.*;

import com.itacadam.myapp.api.requests.ProductCreationRequest;
import com.itacadam.myapp.models.Product;
import com.itacadam.myapp.services.ProductService;

import java.util.List;

@RestController
@RequestMapping("/api/v1/products")
@CrossOrigin(origins = "*")
public class ProductController {

    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @PostMapping
    public Product createProduct(@RequestBody ProductCreationRequest productCreationRequest) {
        return productService.createProduct(productCreationRequest);
    }

    @GetMapping("/{id}")
    public Product getBand(@PathVariable long id) {
        return productService.getProduct(id).orElse(null);
    }


    @GetMapping("/getall")
    public List<Product> getAllProducts() {
        return productService.getAllProducts();
    }


}
