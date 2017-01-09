package model;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.dao.LocationDaoImpl;

@Service(value="locationDetailService")
@Transactional
public class LocationDetailService {

	@Autowired
	@Resource(name="locationDao")
	LocationDaoImpl locationDaoImpl;
	
}