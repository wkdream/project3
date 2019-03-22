package com.services;

import java.util.List;

import com.pojo.Page;
import com.pojo.Provider;

public interface ProviderService {
	public List<Provider> findAll();
	public List<Provider> getAllProviderByPage(Page page);
	public void delProvider(String p_id);
	public void updateProvider(Provider provider);
	public Provider findproviderByName(String p_name);
	public void addprovider(Provider provider);
	public List<Provider> findproviderlikeName(String p_name);
}
