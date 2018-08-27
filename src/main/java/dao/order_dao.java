package dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Order;

@Repository
public interface order_dao {
	@Select("select o.*,addr.addr address,addr.name addrname,u.email uname from orders o inner join address addr inner join user u on o.user_id=u.id and o.address_id=addr.id ")
	public List<Order> select();
    @Update("update orders set status=5 where id=#{id}")
	public void agree(int id);
    @Update("update orders set status=6 where id=#{id}") 
    public void refuse(int id);
    @Select("select * from orders where id=#{id}")
    public List<Order> byId(int id);
	
}
