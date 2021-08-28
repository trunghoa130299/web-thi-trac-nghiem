package vn.codegym.model;

import javax.persistence.*;
import java.io.Serializable;


@Entity
@Table(name="phuong_an")
public class PhuongAn implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String username;
	private int totalCorrect = 0;

	@OneToOne
	@JoinColumn(name="id_cau_hoi")
	private CauHoi cauHoi;

	public PhuongAn() {
	}


	public PhuongAn(int id, String username, int totalCorrect, CauHoi cauHoi) {
		this.id = id;
		this.username = username;
		this.totalCorrect = totalCorrect;
		this.cauHoi = cauHoi;
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getTotalCorrect() {
		return totalCorrect;
	}

	public void setTotalCorrect(int totalCorrect) {
		this.totalCorrect = totalCorrect;
	}

	public CauHoi getCauHoi() {
		return this.cauHoi;
	}

	public void setCauHoi(CauHoi cauHoi) {
		this.cauHoi = cauHoi;
	}

}