package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.product_dao;
import dao.shopcar_dao;
import entity.Product;
import entity.Shopcar;
import jsonInfo.searchInfo;
import service.product_service;
import service.shopcar_service;
@Service
public class shopcar_serviceImpl implements shopcar_service{
    @Autowired
    shopcar_dao dao;

	public List<Shopcar> select() {
		// TODO Auto-generated method stub
		return dao.select();
	}

}
