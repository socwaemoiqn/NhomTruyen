package org.vn.vietvuong.bean;

public class Student {
	private String name;
	public Student() {}
	public Student(String name, int tuoi) {
		this.name = name;
		this.tuoi = tuoi;
	}
	private int tuoi;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTuoi() {
		return tuoi;
	}
	public void setTuoi(int tuoi) {
		this.tuoi = tuoi;
	}
	

}
