package com.example.demo.service;

import java.util.List;

import javax.transaction.Transactional;

@Transactional
public interface PlaceService {

	List<String> getPlaceNames();
}
