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
	
	// 안드로이드
	// 주문 리스트 찾기
	@RequestMapping(value="/getOrderList", method=RequestMethod.POST)
	@ResponseBody
	public List<OrderVo> getOrderList(double order_lat, double order_lng, int range) throws Exception {
		List<OrderVo> orderList = orderService.getOrderList(order_lat, order_lng, range);
		return orderList;
	}
	
	// 주문 선택하기
	@RequestMapping(value="/pickOrder", method=RequestMethod.POST)
	@ResponseBody
	public String pickOrder(int order_no, int dlvr_no) throws Exception {
		String result = orderService.pickOrder(order_no, dlvr_no);
		return result;
	}
	
	@RequestMapping(value="/getPickedOrder", method=RequestMethod.POST)
	@ResponseBody
	public OrderVo getPickedOrder(int dlvr_no) throws Exception {
		OrderVo orderVo = orderService.getPickedOrder(dlvr_no);
		return orderVo;
	}
	
	@RequestMapping(value="/cancelDelivery", method=RequestMethod.POST)
	@ResponseBody
	public String cancelDelivery(int order_no, int dlvr_no) throws Exception {
		String result = orderService.cancelDelivery(order_no, dlvr_no);
		return result;
	}
}
