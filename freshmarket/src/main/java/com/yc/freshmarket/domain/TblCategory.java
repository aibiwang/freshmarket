package com.yc.freshmarket.domain;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 商品类型实体
 * @author liu-pc
 *
 */
@Entity	//实体类注解
@Table(name="tbl_category")	// 配置表名
public class TblCategory {

	@Id	//注解注解
	@GeneratedValue(strategy=GenerationType.AUTO)	//配置主键值的生成机制	
	private Integer categoryId;		//类型id
	@Column
	private String categoryName;	//类型名称
	private Integer parentId;		//商品id
	
	@OneToMany(targetEntity=TblGoods.class,mappedBy="categoryId")
	private List<TblGoods> listGoods;
	
	
	
	public List<TblGoods> getListGoods() {
		return listGoods;
	}
	public void setListGoods(List<TblGoods> listGoods) {
		this.listGoods = listGoods;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	@Override
	public String toString() {
		return "TblCategory [categoryId=" + categoryId + ", categoryName="
				+ categoryName + ", parentId=" + parentId + ", listGoods="
				+ listGoods + "]";
	}
	
	
	
	
	
}
