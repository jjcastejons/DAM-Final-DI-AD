package com.itacadam.myapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.itacadam.myapp.models.User;

public interface UserRepository extends JpaRepository<User, Long> {
}