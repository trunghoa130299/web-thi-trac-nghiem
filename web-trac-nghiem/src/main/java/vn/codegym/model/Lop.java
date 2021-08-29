package vn.codegym.model;

import org.hibernate.annotations.Nationalized;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;


@Entity
@Table(name="lop")
public class Lop implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_lop")
	private int idLop;

	@Column(name="ten_lop",unique = true)
	@Nationalized
	private String tenLop;

	@OneToMany(mappedBy="lop")
	private List<DeThi> deThis;

	public Lop() {
	}
	
	public Lop(String tenLop) {
		this.tenLop=tenLop;
	}

	public int getIdLop() {
		return this.idLop;
	}

	public void setIdLop(int idLop) {
		this.idLop = idLop;
	}

	public String getTenLop() {
		return this.tenLop;
	}

	public void setTenLop(String tenLop) {
		this.tenLop = tenLop;
	}

	public List<DeThi> getDeThis() {
		return this.deThis;
	}

	public void setDeThis(List<DeThi> deThis) {
		this.deThis = deThis;
	}

	public DeThi addDeThi(DeThi deThi) {
		getDeThis().add(deThi);
		deThi.setLop(this);

		return deThi;
	}

	public DeThi removeDeThi(DeThi deThi) {
		getDeThis().remove(deThi);
		deThi.setLop(null);

		return deThi;
	}

}