package com.gph.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

public interface FileService {
    void fileuploadFile(MultipartFile uploadFile, HttpServletRequest request);
    void deletefile(String delete_fileUrl,HttpServletRequest request);
}
