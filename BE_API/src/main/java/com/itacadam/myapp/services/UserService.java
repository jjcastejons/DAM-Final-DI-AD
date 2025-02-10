package com.itacadam.myapp.services;
import org.springframework.stereotype.Service;
import com.itacadam.myapp.api.requests.UserCreationRequest;
import com.itacadam.myapp.models.User;
import com.itacadam.myapp.repository.UserRepository;
import java.util.List;
import java.util.Optional;


@Service
public class UserService {


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
        return userRepository.findAll();
    }

}