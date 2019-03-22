package com.mappers;

import java.util.List;

import com.pojo.Page;
import com.pojo.Provider;

public interface ProviderMapper {
	public List<Provider> findAll();
	public List<Provider> getAllProviderByPage(Page page);
	public void delProvider(String p_id);
	public void addProvider(Provider provider);
	public void updateProvider(Provider provider);
	public Provider findproviderByName(String p_name);
	public List<Provider> findproviderlikeName(String p_name);
}
