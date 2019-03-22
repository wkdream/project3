package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mappers.ProviderMapper;
import com.pojo.Page;
import com.pojo.Provider;

@Service
public class ProviderServiceImpl implements ProviderService{
	
	@Autowired
	private ProviderMapper providerMapper;
	@Override
	public List<Provider> findAll() {
		// TODO Auto-generated method stub
		List<Provider> list = providerMapper.findAll();
		return list;
	}

	@Override
	public void delProvider(String p_id) {
		// TODO Auto-generated method stub
		providerMapper.delProvider(p_id);
	}
	@Override
	public void updateProvider(Provider provider) {
		// TODO Auto-generated method stub
		providerMapper.updateProvider(provider);
	}
	@Override
	public void addprovider(Provider provider) {
		// TODO Auto-generated method stub
		providerMapper.addProvider(provider);
	}

	@Override
	public Provider findproviderByName(String p_name) {
		// TODO Auto-generated method stub
		Provider p=providerMapper.findproviderByName(p_name);
		return p;
	}

	@Override
	public List<Provider> findproviderlikeName(String p_name) {
		// TODO Auto-generated method stub
		List<Provider> list = providerMapper.findproviderlikeName(p_name);
		return list;
	}

	@Override
	public List<Provider> getAllProviderByPage(Page page) {
		// TODO Auto-generated method stub
		List<Provider> list = providerMapper.getAllProviderByPage(page);
		return list;
	}
}
