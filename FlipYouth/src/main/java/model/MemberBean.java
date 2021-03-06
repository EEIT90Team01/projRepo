package model;


import java.io.Serializable;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;
@Entity
@Table(name="Member")
@Component(value="memberBean")
public class MemberBean implements Serializable{
	private Integer mbrSN;
	private String nickName;
	private String mbrId;
	private String mbrPassword;
	private String mbrName;
	private String gender;
	private java.util.Date createTime;
	private String phone;
	private String address;
	private String mbrEmail;
	@Column(name="image")
	private byte[] image;
	private Integer mbrState;
	private Integer energy;
	private Integer rptCounter;
	@Column(name="activatedCode")
	private byte[] activatedCode;
	
	public MemberBean() {
		
	}
	
	
	//Set<> 不會有重覆值,但取出來時不一定會按照順序
		@OneToMany(cascade=CascadeType.REMOVE , fetch=FetchType.EAGER , mappedBy="mbrSN")
		private Set<RelationBean> mbrSNRelation =new HashSet<RelationBean>();
		
		@OneToMany(cascade=CascadeType.REMOVE , fetch=FetchType.EAGER , mappedBy="targetMbrSN")
		private Set<RelationBean> targetMbrSN =new HashSet<RelationBean>();
		
		
	 
	@Id
	@Column(name="mbrSN")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getMbrSN() {
		return mbrSN;
	}
	public void setMbrSN(Integer mbrSN) {
		this.mbrSN = mbrSN;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getMbrId() {
		return mbrId;
	}
	public void setMbrId(String mbrId) {
		this.mbrId = mbrId;
	}
	public String getMbrPassword() {
		return mbrPassword;
	}
	public void setMbrPassword(String mbrPassword) {
		this.mbrPassword = mbrPassword;
	}
	public String getMbrName() {
		return mbrName;
	}
	public void setMbrName(String mbrName) {
		this.mbrName = mbrName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public java.util.Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMbrEmail() {
		return mbrEmail;
	}
	public void setMbrEmail(String mbrEmail) {
		this.mbrEmail = mbrEmail;
	}
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	public Integer getMbrState() {
		return mbrState;
	}
	public void setMbrState(Integer mbrState) {
		this.mbrState = mbrState;
	}
	public Integer getEnergy() {
		return energy;
	}
	public void setEnergy(Integer energy) {
		this.energy = energy;
	}
	public Integer getRptCounter() {
		return rptCounter;
	}
	public void setRptCounter(Integer rptCounter) {
		this.rptCounter = rptCounter;
	}
	public byte[] getActivatedCode() {
		return activatedCode;
	}
	public void setActivatedCode(byte[] activatedCode) {
		this.activatedCode = activatedCode;
	}
	@Override
	public String toString() {
		return "MemberBean [mbrSN=" + mbrSN + ", nickName=" + nickName + ", mbrId=" + mbrId + ", mbrPassword="
				+ mbrPassword + ", mbrName=" + mbrName + ", gender=" + gender + ", createTime=" + createTime
				+ ", phone=" + phone + ", address=" + address + ", mbrEmail=" + mbrEmail + ", image="
				+ Arrays.toString(image) + ", mbrState=" + mbrState + ", energy=" + energy + ", rptCounter="
				+ rptCounter + ", activatedCode=" + Arrays.toString(activatedCode) + "]";
	}
		public MemberBean(Integer mbrSN, String nickName, String mbrId, String mbrPassword, String mbrName, String gender,
				java.util.Date createTime, String phone, String address, String mbrEmail, byte[] image, Integer mbrState,
			Integer energy, Integer rptCounter, byte[] activatedCode) {
		super();
		this.mbrSN = mbrSN;
		this.nickName = nickName;
		this.mbrId = mbrId;
		this.mbrPassword = mbrPassword;
		this.mbrName = mbrName;
		this.gender = gender;
		this.createTime = createTime;
		this.phone = phone;
		this.address = address;
		this.mbrEmail = mbrEmail;
		this.image = image;
		this.mbrState = mbrState;
		this.energy = energy;
		this.rptCounter = rptCounter;
		this.activatedCode = activatedCode;
	}
	public MemberBean(Integer mbrSN) {
		super();
		this.mbrSN = mbrSN;
	}
	
}
