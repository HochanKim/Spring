package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Code;
import com.example.test1.model.ItemList;

@Mapper
public interface ItemMapper {
	
	List<ItemList> selectItemList(HashMap<String, Object> map);
	List<Code> selectCodeList(HashMap<String, Object> map);

}
