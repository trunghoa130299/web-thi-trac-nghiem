package vn.codegym.model;

import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Component
@Entity
@Table(name="cau_hoi")
public class CauHoi implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int quesId;
	private String title;
	private String optionA;
	private String optionB;
	private String optionC;
	private int ans;
	private int chose;

	@ManyToOne
	@JoinColumn(name="id_bo_de")
	private DeThi deThi;

	@OneToMany(mappedBy= "cauHoi")
	private Set<PhuongAn> phuongAns;



	public CauHoi() {
	}


	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public int getQuesId() {
		return quesId;
	}

	public void setQuesId(int quesId) {
		this.quesId = quesId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getOptionA() {
		return optionA;
	}

	public void setOptionA(String optionA) {
		this.optionA = optionA;
	}

	public String getOptionB() {
		return optionB;
	}

	public void setOptionB(String optionB) {
		this.optionB = optionB;
	}

	public String getOptionC() {
		return optionC;
	}

	public void setOptionC(String optionC) {
		this.optionC = optionC;
	}

	public int getAns() {
		return ans;
	}

	public void setAns(int ans) {
		this.ans = ans;
	}

	public int getChose() {
		return chose;
	}

	public void setChose(int chose) {
		this.chose = chose;
	}

	public Set<PhuongAn> getPhuongAns() {
		return phuongAns;
	}

	public void setPhuongAns(Set<PhuongAn> phuongAns) {
		this.phuongAns = phuongAns;
	}

	@Override
	public String toString() {
		return "CauHoi [quesId=" + quesId + ", title=" + title + ", optionA=" + optionA + ", optionB=" + optionB + ", optionC=" + optionC + ", ans=" + ans + ", chose=" + chose + "]";

	}
}