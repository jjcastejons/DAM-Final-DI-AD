package com.itacadam.myapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.itacadam.myapp.models.Order;


public interface OrderRepository extends JpaRepository<Order, Long> {
}