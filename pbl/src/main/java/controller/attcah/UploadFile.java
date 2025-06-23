package controller.attcah;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.google.gson.Gson;

import domain.Attach;

import java.io.File;


import lombok.extern.slf4j.Slf4j;

@WebServlet("/upload")
@MultipartConfig(location = "d:/upload/tmp", 
	maxRequestSize = 50 * 1024 * 1024, // 한번의 요청 당 최대 파일 크기
	maxFileSize = 10 * 1024 * 1024, // 파일 하나당 최대 크기
	fileSizeThreshold = 1 * 1024 * 1024) // 이 크기를 넘어가면 location위치에 buffer를 기록

@Slf4j
public class UploadFile extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/uploadForm.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 업로드된 파일처리
		Collection<Part> parts = req.getParts();
		final String UPLOAD_PATH = "d:/upload/files";
		List<Attach> attachs = new ArrayList<Attach>();
		
		for(Part part : parts) {
			if(part.getSize() == 0) {
				continue;
			}
			
			Long fileSize = part.getSize();
			String origin = part.getSubmittedFileName();
			String contentType = part.getHeader("content-type");
		
			
			// image/png, image/jpg, image/gif, image/webp, image/bmp, image/jpeg
			
			// ext추출
			int idx = origin.lastIndexOf(".");
			String ext = "";
			if(idx >= 0) {
				// 확장자가 존재하는 경우
				ext = origin.substring(idx);
			}
			
			UUID uuid = UUID.randomUUID();
			String fileName = uuid + ext;
			
			boolean image = contentType.startsWith("image");
			String path = genPath();
			String realPath = UPLOAD_PATH + "/" + path + "/";
			
			File file = new File(realPath);
			if(!file.exists()) {
				file.mkdirs();
			}
			
			part.write(realPath + fileName);
			
			log.info("{} :: {} :: {} :: {}", fileSize, origin, contentType, ext);
			attachs.add(Attach.builder().uuid(fileName).origin(origin).image(image).path(path).build());
		}
		resp.setContentType("application/json; charset=utf-8");
		resp.getWriter().print(new Gson().toJson(attachs));
//		resp.sendRedirect("upload");
	}
	
	private String genPath() {
		return new SimpleDateFormat("yyyy/MM/dd").format(new Date());
	}
}
