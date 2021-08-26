package vn.codegym.model;

import org.hibernate.annotations.Nationalized;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;
import java.util.List;



@Entity
@Table(name="de_thi")
@NamedQuery(name="DeThi.findAll", query="SELECT d FROM DeThi d")
public class DeThi implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_de")
	private int idDe;

	@Column(name="ten_de")
	@Nationalized
	@NotBlank(message = "Không được để trống trường này!")
	@Size(min = 4,max=1000 ,message = "Ký tự phải nằm trong khoảng 4-1000!")
	private String tenDe;
	@Column(name="mo_ta",length = 1000)
	@Nationalized
	private String moTa;
	
	@Column(name="ngay_tao")
	@Temporal(TemporalType.TIMESTAMP)
	private Date ngayTao;
	
	@Column(length = 1000)
	private boolean hienThiDapAnVaGiaiThich;
	
	@Column()
	private int thoiGianThi;

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public boolean isHienThiDapAnVaGiaiThich() {
		return hienThiDapAnVaGiaiThich;
	}

	public void setHienThiDapAnVaGiaiThich(boolean hienThiDapAnVaGiaiThich) {
		this.hienThiDapAnVaGiaiThich = hienThiDapAnVaGiaiThich;
	}

	public int getThoiGianThi() {
		return thoiGianThi;
	}

	public void setThoiGianThi(int thoiGianThi) {
		this.thoiGianThi = thoiGianThi;
	}

	public Date getNgayTao() {
		return ngayTao;
	}

	public void setNgayTao(Date ngayTao) {
		this.ngayTao = ngayTao;
	}

	@OneToMany(mappedBy="deThi")
	private List<CauHoi> cauHois;

	@ManyToOne
	@JoinColumn(name="id_lop")
	private Lop lop;

	@ManyToOne
	@JoinColumn(name="id_mon_hoc")
	private MonHoc monHoc;

	@ManyToOne
	@JoinColumn(name="username_nguoi_tao")
	private User taiKhoan;

	@OneToMany(mappedBy="deThi")
	private List<ThamGiaThi> thamGiaThis;

	public DeThi() {
	}

	public int getIdDe() {
		return this.idDe;
	}

	public void setIdDe(int idDe) {
		this.idDe = idDe;
	}


	public String getTenDe() {
		return this.tenDe;
	}

	public void setTenDe(String tenDe) {
		this.tenDe = tenDe;
	}

	public List<CauHoi> getCauHois() {
		return this.cauHois;
	}

	public void setCauHois(List<CauHoi> cauHois) {
		this.cauHois = cauHois;
	}

	public CauHoi addCauHoi(CauHoi cauHoi) {
		getCauHois().add(cauHoi);
		cauHoi.setDeThi(this);

		return cauHoi;
	}

	public CauHoi removeCauHoi(CauHoi cauHoi) {
		getCauHois().remove(cauHoi);
		cauHoi.setDeThi(null);

		return cauHoi;
	}

	public Lop getLop() {
		return this.lop;
	}

	public void setLop(Lop lop) {
		this.lop = lop;
	}

	public MonHoc getMonHoc() {
		return this.monHoc;
	}

	public void setMonHoc(MonHoc monHoc) {
		this.monHoc = monHoc;
	}

	public User getTaiKhoan() {
		return this.taiKhoan;
	}

	public void setTaiKhoan(User taiKhoan) {
		this.taiKhoan = taiKhoan;
	}

	public List<ThamGiaThi> getThamGiaThis() {
		return this.thamGiaThis;
	}

	public void setThamGiaThis(List<ThamGiaThi> thamGiaThis) {
		this.thamGiaThis = thamGiaThis;
	}

	public ThamGiaThi addThamGiaThi(ThamGiaThi thamGiaThi) {
		getThamGiaThis().add(thamGiaThi);
		thamGiaThi.setDeThi(this);

		return thamGiaThi;
	}

	public ThamGiaThi removeThamGiaThi(ThamGiaThi thamGiaThi) {
		getThamGiaThis().remove(thamGiaThi);
		thamGiaThi.setDeThi(null);

		return thamGiaThi;
	}

	@Override
	public String toString() {
		return "DeThi [idDe=" + idDe + ", tenDe=" + tenDe + ", moTa=" + moTa + ", thoiGianThi=" + thoiGianThi + "]";
	}

	
	
	

}