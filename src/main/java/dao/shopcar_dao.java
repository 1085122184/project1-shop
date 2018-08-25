package dao;

import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Repository;

@Repository
public interface shopcar_dao {

	@Insert("insert into shopcar(uer_id,product_id,count) value(1,#{id},#{count})")
	public void insert();
}
