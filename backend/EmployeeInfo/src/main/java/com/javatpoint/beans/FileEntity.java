package com.javatpoint.beans;

import java.io.File;

/**
 * 作成者 : エエティン
 * クラス名 : Emp 
 * 概要 　　: 社員情報モデル
 * 作成日　:　2021/09/09
 */

public class FileEntity {
	
	File uploadFile;

	public File getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(File uploadFile) {
		this.uploadFile = uploadFile;
	}
}