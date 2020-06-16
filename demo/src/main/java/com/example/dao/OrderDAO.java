package com.example.dao;

import java.util.List;
import java.util.Map;

import com.example.vo.OrderVO;

public interface OrderDAO {
	public List<OrderVO> selectItemOrder();
}