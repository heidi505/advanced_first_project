package com.tenco.team_two_flight_ticket._core.utils;

import com.tenco.team_two_flight_ticket._core.handler.exception.MyBadRequestException;
import com.tenco.team_two_flight_ticket._core.vo.MyPath;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

public class PicUrl {
    public static String save(MultipartFile pic, String originalFilename) {
        UUID uuid = UUID.randomUUID();

        String picName = uuid + "_" + originalFilename;

        Path filePath = Paths.get(MyPath.IMG_PATH + picName);


        try {
            Files.write(filePath, pic.getBytes());
        } catch (IOException e) {
            throw new MyBadRequestException("경로 오류가 발생했습니다.");
        }
        return picName;
    }
}
