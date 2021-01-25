package com.kh.delivery.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.delivery.domain.OrderVo;
import com.kh.delivery.domain.UserVo;
import com.kh.delivery.service.OrderService;

@Controller
@RequestMapping(value="/order")
public class OrderController {

	@Inject
	OrderService orderService;
	
	// 웹
	// 주문페이지
	@RequestMapping(value="/orderForm", method=RequestMethod.GET)
	public String orderForm() throws Exception {
		return "user/orderForm";
	}
	

	@RequestMapping(value="/newOrderForm", method=RequestMethod.GET)
	public String newOrderForm() throws Exception{
		return "user/newOrderForm";
	}
	
	// 주문하기
	@RequestMapping(value="/insertOrder", method=RequestMethod.POST)
	public String insertOrder(OrderVo orderVo, RedirectAttributes rttr) throws Exception {
		String result = orderService.insertOrder(orderVo);
		rttr.addFlashAttribute("orderResult", result);
		return "redirect:/user/orderList";
	}
	
	// 주문취소(배달취소 아님)
	@RequestMapping(value="/cancelOrder", method=RequestMethod.POST)
	@ResponseBody
	public String cancelOrder(int order_no) throws Exception {
		String result = orderService.orderCancel(order_no);
		return result;
	}
	
	// 안드로이드
	// 주문 리스트 찾기
	@RequestMapping(value="/android/getOrderList", method=RequestMethod.POST)
	@ResponseBody
	public List<OrderVo> getOrderList(double order_lat, double order_lng) throws Exception {
		List<OrderVo> orderList = orderService.getOrderList(order_lat, order_lng);
		return orderList;
	}

	// 주문 선택하기
	@RequestMapping(value="/android/pickOrder", method=RequestMethod.POST)
	@ResponseBody
	public String pickOrder(int order_no, int dlvr_no) throws Exception {
		String result = orderService.pickOrder(order_no, dlvr_no);
		return result;
	}

	// 수락한 주문정보 가져오기
	@RequestMapping(value="/android/getPickedOrder", method=RequestMethod.POST)
	@ResponseBody
	public OrderVo getPickedOrder(int dlvr_no) throws Exception {
		OrderVo orderVo = orderService.getPickedOrder(dlvr_no);
		return orderVo;
	}

	// 배달 취소
	@RequestMapping(value="/android/cancelDelivery", method=RequestMethod.POST)
	@ResponseBody
	public String cancelDelivery(int order_no, int dlvr_no) throws Exception {
		String result = orderService.cancelDelivery(order_no, dlvr_no);
		return result;
	}
	
	// 배달 완료
	@RequestMapping(value="/android/deliveryCompleted", method=RequestMethod.POST)
	@ResponseBody
	public String deliveryCompleted(OrderVo orderVo) throws Exception {
		String result = orderService.deliveryCompleted(orderVo);
		return result;
	}
	
	// 배달 완료 목록 가져오기
	@RequestMapping(value="/android/getDeliveryList", method=RequestMethod.POST)
	@ResponseBody
	public List<OrderVo> getDeliveryList(int dlvr_no) throws Exception {
		List<OrderVo> orderList = orderService.getDeliveryList(dlvr_no);
		return orderList;
	}
}
