package com.best.kgw.service;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;

@Service
public class FileService {
    Logger logger = LoggerFactory.getLogger(FileService.class);

    public void fileUpload(String fileFolder, MultipartFile file, HttpServletRequest req) throws Exception{
        String realFolder = "";
        String saveFolder = "/fileUpload/"+ fileFolder + "/";

        //현재 파일경로
        ServletContext context = req.getServletContext();
        realFolder = context.getRealPath(saveFolder);
        logger.info("context : "+ realFolder);

        // 파일 저장 경로에 폴더가 없으면 생성
        File folder = new File(realFolder);
        if (!folder.exists()) {
            folder.mkdirs();
        }

        // 파일 이름 설정
        String fileName = file.getOriginalFilename();
        String filePath = realFolder + fileName;
        logger.info(filePath);
        // 업로드된 파일 저장
        for (Part part : req.getParts()) {
            // 파일 이름이 null이 아닌 경우에만 저장
            if (!fileName.isEmpty()) {
                logger.info(req.getParts().toString());
                part.write(filePath);
            }
        }
    }
}
