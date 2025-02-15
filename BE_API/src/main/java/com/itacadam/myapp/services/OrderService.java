package com.itacadam.myapp.services;


import org.springframework.stereotype.Service;

import com.itacadam.myapp.api.requests.OrderCreationRequest;
import com.itacadam.myapp.api.requests.ProductCreationRequest;
import com.itacadam.myapp.models.Order;
import com.itacadam.myapp.repository.OrderRepository;
import com.itacadam.myapp.repository.ProductRepository;


import java.util.List;
import java.util.Optional;


@Service
public class OrderService {


    private final OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public Order createOrder(OrderCreationRequest orderCreationRequest) {
        return orderRepository.save(mapToOrder(orderCreationRequest));
    }

    public void removeOrder(Long id) {
        orderRepository.deleteById(id);
    }

    private Order mapToOrder(OrderCreationRequest createRequest) {
        Order order = new Order();
        order.setDescripcion(createRequest.descripcion());
        order.setPrecio(createRequest.precio());
        order.setEstado(createRequest.estado());
        order.setComprador(createRequest.comprador());
        return order;
    }

    public Optional<Order> getOrder(final Long id) {
        return orderRepository.findById(id);
    }

    public List<Order> getAllOrders() {
        List<Order> list = orderRepository.findAll();
        return orderRepository.findAll();
    }

}