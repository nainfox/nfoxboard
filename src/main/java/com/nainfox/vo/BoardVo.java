package com.nainfox.vo;

import javax.validation.constraints.Size;

public class BoardVo {

//	id	int(11)	NO	PRI	NULL	auto_increment
//	title	varchar(60)	NO		NULL	
//	name	varchar(30)	NO		NULL	
//	regdate	datetime	NO		NULL	
//	hit	int(11)	NO		NULL	
//	content	blob	NO		NULL	

	private int id;
	@Size(min=1, max=20, message="최소 1글자 이상 최대 20글자 이하까지 입력가능합니다.")
	private String title;
	@Size(min=2, max=10, message="이름은 최소 2글자 최대 10글자까지 입력가능합니다.")
	private String name;
	private String regdate;
	private int hit;
	@Size(min=3, max=1000, message="3글자 이상 1000글자 이내로 입력하세요.")
	private String content;

	public int getId() {
		return id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

}
