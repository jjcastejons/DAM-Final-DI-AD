package com.itacadam.myapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.itacadam.myapp.models.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {
}