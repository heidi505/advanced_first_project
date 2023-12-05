package com.tenco.team_two_flight_ticket.user;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserRepository {
    public int insert(User user);
    public User findByUsernameAndPassword(UserRequest.SignInDTO dto);
    public int updateByUserId(UserRequest.UserUpdateDTO dto);
}
