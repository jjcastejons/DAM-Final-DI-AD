package com.itacadam.myapp.services;
import org.springframework.stereotype.Service;
import com.itacadam.myapp.api.requests.UserCreationRequest;
import com.itacadam.myapp.models.User;
import com.itacadam.myapp.repository.UserRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@Service
public class UserService {

    private static final Logger logger = LoggerFactory.getLogger(UserService.class);
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User createUser(UserCreationRequest userCreationRequest) {
        return userRepository.save(mapToUser(userCreationRequest));
    }

    private User mapToUser(UserCreationRequest createRequest) {
        User user = new User();
        user.setNombre(createRequest.nombre());
        user.setContrasena(createRequest.contrasena());
        user.setEdad(createRequest.edad());
        user.setAdministrador(createRequest.administrador());
        return user;
    }

    public void removeUser(Long id) {
        userRepository.deleteById(id);
    }


    public Optional<User> getUser(final long id) {
        return userRepository.findById(id);
    }


    public List<User> getAllUsers() {
        logger.info("Listado de usuarios");

        try {
            return userRepository.findAll();
        } catch (Exception e) {
            logger.error("Error en listado de usuarios {}", e);
            return new ArrayList<>();
        }       
    }

}