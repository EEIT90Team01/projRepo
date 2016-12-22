package model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.context.annotation.Lazy;
@Entity
@Table(name = "Game")
public class ShopBean implements Serializable {
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	@Column(name="GameSN")
	private Integer GameSN;
	private String GameName;// 商品名稱
	private String Introduction;// 簡介
	private String PlayingTime;// 遊戲時間
	private String PlayerNumber;// 人數
	private String BigImage;// 大圖
	private String SmallImage;// 縮圖
	private Integer StockQuantity;// 庫存
	private String Gameclass;// 遊戲分類
	private String Ages;// 年齡
	private String StrGameTheme;// 遊戲主題
	private String StrGameMechanics;// 遊戲機制
	private String StrLanguage;// 遊戲語言
	private Integer Price;// 價格
	private String Discount;// 優惠價格
	private String Freight;// 運送方式
	private String div1;// 遊戲介紹

	
	
	@Override
	public String toString() {
		return "ShopBean [GameSN=" + GameSN + ", GameName=" + GameName + ", Introduction=" + Introduction
				+ ", PlayingTime=" + PlayingTime + ", PlayerNumber=" + PlayerNumber + ", BigImage=" + BigImage
				+ ", SmallImage=" + SmallImage + ", StockQuantity=" + StockQuantity + ", Gameclass=" + Gameclass
				+ ", Ages=" + Ages + ", StrGameTheme=" + StrGameTheme + ", StrGameMechanics=" + StrGameMechanics
				+ ", StrLanguage=" + StrLanguage + ", Price=" + Price + ", Discount=" + Discount + ", Freight="
				+ Freight + ", div1=" + div1 + ", getGameSN()=" + getGameSN() + ", getGameName()=" + getGameName()
				+ ", getIntroduction()=" + getIntroduction() + ", getPlayingTime()=" + getPlayingTime()
				+ ", getPlayerNumber()=" + getPlayerNumber() + ", getBigImage()=" + getBigImage() + ", getSmallImage()="
				+ getSmallImage() + ", getStockQuantity()=" + getStockQuantity() + ", getGameclass()=" + getGameclass()
				+ ", getAges()=" + getAges() + ", getStrGameTheme()=" + getStrGameTheme() + ", getStrGameMechanics()="
				+ getStrGameMechanics() + ", getStrLanguage()=" + getStrLanguage() + ", getPrice()=" + getPrice()
				+ ", getDiscount()=" + getDiscount() + ", getFreight()=" + getFreight() + ", getDiv1()=" + "很長你會怕"
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}

	public void setPrice(Integer price) {
		Price = price;
	}

	public Integer getGameSN() {
		return GameSN;
	}

	public void setGameSN(Integer gameSN) {
		GameSN = gameSN;
	}
	
	 @Column(name="GameName")
	public String getGameName() {
		return GameName;
	}

	public void setGameName(String gameName) {
		GameName = gameName;
	}

	public String getIntroduction() {
		return Introduction;
	}

	public void setIntroduction(String introduction) {
		Introduction = introduction;
	}

	public String getPlayingTime() {
		return PlayingTime;
	}

	public void setPlayingTime(String playingTime) {
		PlayingTime = playingTime;
	}

	public String getPlayerNumber() {
		return PlayerNumber;
	}

	public void setPlayerNumber(String playerNumber) {
		PlayerNumber = playerNumber;
	}

	public String getBigImage() {
		return BigImage;
	}

	public void setBigImage(String bigImage) {
		BigImage = bigImage;
	}

	public String getSmallImage() {
		return SmallImage;
	}

	public void setSmallImage(String smallImage) {
		SmallImage = smallImage;
	}

	public Integer getStockQuantity() {
		return StockQuantity;
	}

	public void setStockQuantity(Integer stockQuantity) {
		StockQuantity = stockQuantity;
	}

	public String getGameclass() {
		return Gameclass;
	}

	public void setGameclass(String gameclass) {
		Gameclass = gameclass;
	}

	public String getAges() {
		return Ages;
	}

	public void setAges(String ages) {
		Ages = ages;
	}

	public String getStrGameTheme() {
		return StrGameTheme;
	}

	public void setStrGameTheme(String strGameTheme) {
		StrGameTheme = strGameTheme;
	}

	public String getStrGameMechanics() {
		return StrGameMechanics;
	}

	public void setStrGameMechanics(String strGameMechanics) {
		StrGameMechanics = strGameMechanics;
	}

	public String getStrLanguage() {
		return StrLanguage;
	}

	public void setStrLanguage(String strLanguage) {
		StrLanguage = strLanguage;
	}

	public Integer getPrice() {
		return Price;
	}

	public String getDiscount() {
		return Discount;
	}

	public void setDiscount(String discount) {
		Discount = discount;
	}

	public String getFreight() {
		return Freight;
	}

	public void setFreight(String freight) {
		Freight = freight;
	}

	public String getDiv1() {
		return div1;
	}

	public void setDiv1(String div1) {
		this.div1 = div1;
	}

}
