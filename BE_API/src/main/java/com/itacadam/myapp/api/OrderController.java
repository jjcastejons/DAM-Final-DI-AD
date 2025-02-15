package com.itacadam.myapp.api;

import org.springframework.web.bind.annotation.*;

import com.itacadam.myapp.api.requests.OrderCreationRequest;
import com.itacadam.myapp.api.requests.ProductCreationRequest;
import com.itacadam.myapp.models.Order;
import com.itacadam.myapp.models.Product;
import com.itacadam.myapp.services.OrderService;

import java.util.List;

@RestController
@RequestMapping("/api/v1/orders")
@CrossOrigin(origins = "*")
public class OrderController {

    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @PostMapping
    public Order createOrder(@RequestBody OrderCreationRequest orderCreationRequest) {
        return orderService.createOrder(orderCreationRequest);
    }

    @GetMapping("/{id}")
    public Order getOrder(@PathVariable Long id) {
        return orderService.getOrder(id).orElse(null);
    }

    @DeleteMapping("/{id}")
    public void deleteOrder(@PathVariable Long id) {
        orderService.removeOrder(id);
    }


    @GetMapping("/getall")
    public List<Order> getAllOrders() {
        return orderService.getAllOrders();
    }


}
