package dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.type;

@Repository
public interface type_dao {
     @Select("select * from type")
	public List<type> select();
	@Insert("insert into type(name,parentid) value(#{name},#{id})")
	public void insert(type t);
	@Select("select * from type where id=#{id}")
	public List<type> ById(int id);

	
}
