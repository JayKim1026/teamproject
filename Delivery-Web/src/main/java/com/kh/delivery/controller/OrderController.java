package com.kh.delivery.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.delivery.domain.OrderVo;
import com.kh.delivery.service.OrderService;

@Controller
@RequestMapping(value="/order")
public class OrderController {

	@Inject
	OrderService orderService;
	
	@RequestMapping(value="/getOrderList", method=RequestMethod.POST)
	@ResponseBody
	public List<OrderVo> getOrderList(double order_lat, double order_lng, int range) throws Exception {
		List<OrderVo> orderList = orderService.getOrderList(order_lat, order_lng, range);
		return orderList;
	}
	
}
