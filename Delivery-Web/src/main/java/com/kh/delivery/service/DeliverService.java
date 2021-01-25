package com.kh.delivery.service;

import java.util.List;

import com.kh.delivery.domain.DeliverVo;
import com.kh.delivery.domain.OrderVo;
import com.kh.delivery.domain.TimelineVo;

public interface DeliverService {

	//웹 
	// 로그인
	public DeliverVo login(String dlvr_id, String dlvr_pw) throws Exception;
	// 회원가입
	public String registDeliver(DeliverVo deliverVo) throws Exception;
	// 아이디 중복 체크
	public boolean checkIdDupl(String dlvr_id) throws Exception;
	// 배달원 프로필 사진 변경
	public String imgChange(String dlvr_id, String chg_img) throws Exception;
	// 배달원 현재 비밀번호 확인
	public String pwCheck(String dlvr_id, String orgPw) throws Exception;
	// 배달원 비밀번호 변경
	public String pwChange(String dlvr_id, String chgPw) throws Exception;
	// 배달원 이메일 변경
	public String emailChange(String dlvr_id, String chgEmail) throws Exception;
	// 배달원 휴대전화 변경
	public String phoneChange(String dlvr_id, String chgPhone) throws Exception;
	// 배달원 주소 변경
	public String addrChange(String dlvr_id, String chgAddr) throws Exception;
	// 배달원 배달 랭킹 조회
	public List<DeliverVo> getDlvrRank() throws Exception;
	
	//안드로이드
	// 배달원 정보 수정
	public String modifyDeliver(DeliverVo deliverVo) throws Exception;
	
	// 개발자
	/*신규 회원가입 대기중인 배달원 카운트*/
	public int getWaitingDeliveryCount();
	/*신규 배달원 카운트*/
	public int getNewDeliveryCount();
	/* 배달원 카운트 */
	public int getTotalDeliveryCount();
	/*배달원 리스트*/
	public List<DeliverVo> getDeliverList();
	/*가입 대기중 배달원 리스트*/
	public List<DeliverVo> getWaitingDeliverList();
	public String deliverStateUpdate(int dlvr_no, String dlvr_state);
	
}
