package dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import entity.Shopcar;

@Repository
public interface shopcar_dao {
    @Select("SELECT sc.*,p.fullname,p.pics,p.nowprice,u.email from shopcar sc iNNER JOIN product p ON p.id=sc.product_id INNER JOIN user u on u.id=sc.user_id ")
	public List<Shopcar> select();
	
}
