package com.company.service;

import com.company.dao.UserDAO;
import com.company.model.User;

import java.util.List;

public class UserServiceImpl implements UserService{

    private UserDAO userDAO;

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Override
    public void addUser(User user) {
        this.userDAO.addUser(user);
    }

    @Override
    public void updateUser(User user) {
        this.userDAO.updateUser(user);
    }

    @Override
    public void removeUser(int id) {
        this.userDAO.removeUser(id);
    }

    @Override
    public User getUserById(int id) {
        return this.userDAO.getUserById(id);
    }

    @Override
    public List<User> listUsers() {
        return this.userDAO.listUsers();
    }


}
