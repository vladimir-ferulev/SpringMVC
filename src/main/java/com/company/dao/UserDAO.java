package com.company.dao;

import com.company.model.User;

import java.util.List;

public interface UserDAO {
    void addUser(User user);
    void updateUser(User user);
    void removeUser(int id);
    User getUserById(int id);
    List<User> listUsers();
}
