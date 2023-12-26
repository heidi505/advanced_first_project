package com.tenco.team_two_flight_ticket.user;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserRepository {
    public int insert(User user);
    public User findByUsername(UserRequest.SignInDTO dto);
    public int updateByUserId(UserRequest.UserUpdateDTO dto);
    public User checkUsername(String username);
    public User findUserByEmail(String email);
    public int updatePassword(String password, String email);
	public void saveFcmToken(@Param("userName")String userName ,@Param("fcmToken")String fcmToken); // 토큰 저장


}
