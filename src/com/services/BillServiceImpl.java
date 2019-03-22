package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mappers.BillMapper;
import com.pojo.Bill;
import com.pojo.Page;
import com.pojo.Provider;


@Service
public class BillServiceImpl implements BillService{
	
	@Autowired
	private BillMapper billMapper;
	@Override
	public List<Bill> findAll() {
		// TODO Auto-generated method stub
		List<Bill> list = billMapper.findAll();
		return list;
	}

	@Override
	public void delBill(String b_id) {
		// TODO Auto-generated method stub
		billMapper.delBill(b_id);
	}

	@Override
	public void addBill(Bill bill) {
		// TODO Auto-generated method stub
		billMapper.addBill(bill);
	}

	@Override
	public void updateBill(Bill bill) {
		// TODO Auto-generated method stub
		billMapper.updateBill(bill);
	}

	@Override
	public List<Bill> getAllBillByPage(Page page) {
		// TODO Auto-generated method stub
		List<Bill> list= billMapper.getAllBillByPage(page);
		return list;
	}

	@Override
	public List<Bill> findBilllikeName(String b_name) {
		// TODO Auto-generated method stub
		List<Bill>  list=	billMapper.getAllBillLikeName(b_name);
		return list;
	}

	@Override
	public Bill getAllBillByName(String b_name) {
		// TODO Auto-generated method stub
		Bill bill = billMapper.getAllBillByName(b_name);
		return bill;
	}

	@Override
	public List<Bill> selectBillByNAndC(Bill bill) {
		// TODO Auto-generated method stub
		List<Bill> list = billMapper.selectBillByNAndC(bill);
		return list;
	}

}
