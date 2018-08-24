package dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Admin;
import entity.Product;

@Repository
public interface product_dao {
	@Select("select p.*,t.name tname from product p inner join type t on t.id=p.type_id")
	public List<Product> select();
    @Insert("insert into product(fullname,type_id,priority,nowprice,price,activity,sale,tip,comments,info,status,collectcount,salecount) value(#{fullname},#{id},#{priority},#{nowprice},#{price},#{activity},#{sale},#{tip},#{comments},#{info},0,0,0)")
	public void insert(Product p);
	@Update("update product set status=1 where id=#{id}")
    public void update_off(int id);
	@Update("update product set status=0 where id=#{id}")
    public void update_on(int id);
	@Select("select * from product where id=#{id}")
	public List<Product> byId(int id);
	@Select("select p.*,t.name tname from product p inner join type t on t.id=p.type_id where type_id=#{id}")
	public List<Product> byTypeid(int id);
}
