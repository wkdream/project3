package com.mappers;

import java.util.List;
import com.pojo.Bill;
import com.pojo.Page;
import com.pojo.Provider;

public interface BillMapper {
	public List<Bill> findAll();
	public void delBill(String b_id);
	public void addBill(Bill bill);
	public void updateBill(Bill bill);
	public List<Bill> getAllBillByPage(Page page);
	public List<Bill> getAllBillLikeName(String b_name);
	public Bill getAllBillByName(String b_name);
	public List<Bill> selectBillByNAndC(Bill bill);
}
