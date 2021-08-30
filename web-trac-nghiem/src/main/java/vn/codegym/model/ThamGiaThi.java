package vn.codegym.model;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;


@Entity
@Table(name="tham_gia_thi")
public class ThamGiaThi implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_tham_gia_thi")
	private int idThamGiaThi;

	@Column(name="ngay_gio_bat_dau")
	private Timestamp ngayGioBatDau;

	@Column(name="ngay_gio_ket_thuc")
	private Timestamp ngayGioKetThuc;

	@Column(name="tong_diem")
	private double tongDiem;
	
	@Column()
	private Boolean finished;

	@ManyToOne
	@JoinColumn(name="id_bo_de")
	private DeThi deThi;

	@ManyToOne
	@JoinColumn(name="username")
	private User taiKhoan;

	public ThamGiaThi() {
	}

	public ThamGiaThi(int idThamGiaThi, Timestamp ngayGioBatDau, Timestamp ngayGioKetThuc, double tongDiem,
                      Boolean finished, DeThi deThi, User taiKhoan) {
		super();
		this.idThamGiaThi = idThamGiaThi;
		this.ngayGioBatDau = ngayGioBatDau;
		this.ngayGioKetThuc = ngayGioKetThuc;
		this.tongDiem = tongDiem;
		this.finished = finished;
		this.deThi = deThi;
		this.taiKhoan = taiKhoan;
	}



	public int getIdThamGiaThi() {
		return this.idThamGiaThi;
	}

	public void setIdThamGiaThi(int idThamGiaThi) {
		this.idThamGiaThi = idThamGiaThi;
	}

	public Timestamp getNgayGioBatDau() {
		return this.ngayGioBatDau;
	}

	public void setNgayGioBatDau(Timestamp ngayGioBatDau) {
		this.ngayGioBatDau = ngayGioBatDau;
	}

	public Timestamp getNgayGioKetThuc() {
		return this.ngayGioKetThuc;
	}

	public void setNgayGioKetThuc(Timestamp ngayGioKetThuc) {
		this.ngayGioKetThuc = ngayGioKetThuc;
	}

	
	
	public Boolean getFinished() {
		return finished;
	}

	public void setFinished(Boolean finished) {
		this.finished = finished;
	}

	public double getTongDiem() {
		return this.tongDiem;
	}

	public void setTongDiem(double tongDiem) {
		this.tongDiem = tongDiem;
	}

	public DeThi getDeThi() {
		return this.deThi;
	}

	public void setDeThi(DeThi deThi) {
		this.deThi = deThi;
	}

	public User getTaiKhoan() {
		return this.taiKhoan;
	}

	public void setTaiKhoan(User taiKhoan) {
		this.taiKhoan = taiKhoan;
	}
	public boolean isEqual(String username, Integer idDe, Timestamp tgBatDau) {
		if(username.equals(this.taiKhoan.getUser())&&idDe == this.deThi.getIdDe()) {
			return true;
		}
		return false;
	}

}