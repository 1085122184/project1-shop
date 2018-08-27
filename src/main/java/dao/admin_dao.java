package dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Admin;
import jsonInfo.searchInfo;

@Repository
public interface admin_dao {
	@Select("select * from admin")
	public List<Admin> selectAll();
	@Select("select * from admin where nike=#{nike}")
	public List<Admin> selectbynike(Admin a);
    @Select("select * from admin ${where} ${limit}")
	public List<Admin> select(searchInfo info);
    @Select("select count(id) count from admin ${where}")
    public String count(searchInfo info);
    @Insert("insert into admin(nike,password,name,sex,tel,power,status,comments) values(#{nike},#{md5},#{name},#{sex},#{tel},#{power},0,#{comments})")
    public void insert(Admin ad);
    @Update("update admin set nike=#{nike},name=#{name},sex=#{sex},tel=#{tel},power=#{power},comments=#{comments} where id=#{id}")
    public void update(Admin ad);
	@Update("update admin set status=1 where id=#{id}")
    public void update_off(Integer id);	
	@Update("update admin set status=0 where id=#{id}")
    public void update_on(Integer id);
	@Select("select * from admin where id=#{id}")
	public List<Admin> byId(int id);
	@Update("update admin set password=#{md5} where id=#{id}")
	public void updatepass(Admin ad);
}
