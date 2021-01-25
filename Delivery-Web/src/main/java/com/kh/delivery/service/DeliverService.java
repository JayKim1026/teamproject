package com.kh.delivery.service;

import java.util.List;

import com.kh.delivery.domain.DeliverVo;
import com.kh.delivery.domain.OrderVo;
import com.kh.delivery.domain.TimelineVo;

public interface DeliverService {

	//웹 
	
	/* 배달원 로그인
	 * dlvr_id 배달원 아이디
	 * dlvr_pw 배달원 비밀번호
	 * */
	public DeliverVo login(String dlvr_id, String dlvr_pw) throws Exception;
	
	/* 배달원 회원가입 */
	public String registDeliver(DeliverVo deliverVo) throws Exception;
	
	/* 배달원 아이디 중복 확인 
	 * dlvr_id 회원가입에 사용할 배달원 아이디
	 * */
	public boolean checkIdDupl(String dlvr_id) throws Exception;
	
	/* 배달원 프로필 사진 변경 
	 * chg_img 변경할 프로필 사진 데이터 경로
	 * dlvr_id 해당 계정 아이디
	 * */
	public String imgChange(String dlvr_id, String chg_img) throws Exception;
	
	/* 배달원 현재 비밀번호 확인 
	 * orgPw 사용자가 입력한 기존에 등록되어있던 비밀번호
	 * dlvr_id 해당 계정 아이디
	 * */
	public String pwCheck(String dlvr_id, String orgPw) throws Exception;
	
	/* 배달원 비밀번호 변경 
	 * chgPw 변경할 비밀번호
	 * dlvr_id 해당 계정 아이디
	 * */
	public String pwChange(String dlvr_id, String chgPw) throws Exception;
	
	/* 배달원 이메일 변경 
	 * chgEmail 변경할 이메일 주소
	 * dlvr_id 해당 계정 아이디
	 * */
	public String emailChange(String dlvr_id, String chgEmail) throws Exception;
	
	/* 배달원 휴대전화 번호 변경 
	 * chgPhone 변경할 휴대전화 번호
	 * dlvr_id 해당 계정 아이디
	 * */
	public String phoneChange(String dlvr_id, String chgPhone) throws Exception;
	
	/* 배달원 주소 변경
	 * chgAddr 변경할 주소
	 * dlvr_id 해당 계정 아이디
	 *  */
	public String addrChange(String dlvr_id, String chgAddr) throws Exception;
	
	/* 배달원 배달 랭킹 조회 */
	public List<DeliverVo> getDlvrRank() throws Exception;
	
	/************************************************************************/
	/*                             안드로이드                                                                   */
	/***********************************************************************/
	
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
