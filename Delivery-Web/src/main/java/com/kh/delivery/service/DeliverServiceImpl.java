package com.kh.delivery.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.delivery.dao.DeliverDao;
import com.kh.delivery.domain.DeliverVo;
import com.kh.delivery.domain.OrderVo;
import com.kh.delivery.domain.TimelineVo;

@Service
public class DeliverServiceImpl implements DeliverService {

	@Inject
	DeliverDao deliverDao;
	
	/* 배달원 로그인
	 * dlvr_id 배달원 아이디
	 * dlvr_pw 배달원 비밀번호
	 * */
	@Override
	public DeliverVo login(String dlvr_id, String dlvr_pw) throws Exception {
		DeliverVo deliverVo = deliverDao.login(dlvr_id, dlvr_pw);
		return deliverVo;
	}
	
	/* 배달원 회원가입 */
	@Override
	public String registDeliver(DeliverVo deliverVo) throws Exception {
		String result = deliverDao.registDeliver(deliverVo);
		return result;
	}

	/* 배달원 아이디 중복 확인 
	 * dlvr_id 회원가입에 사용할 배달원 아이디
	 * */
	@Override
	public boolean checkIdDupl(String dlvr_id) throws Exception {
		boolean result = deliverDao.checkIdDupl(dlvr_id);
		return result;
	}
	
	/* 배달원 프로필 사진 변경 
	 * chg_img 변경할 프로필 사진 데이터 경로
	 * dlvr_id 해당 계정 아이디
	 * */
	@Override
	public String imgChange(String dlvr_id, String chg_img) throws Exception {
		String result = deliverDao.imgChange(dlvr_id, chg_img);
		return result;
	}

	/* 배달원 현재 비밀번호 확인 
	 * orgPw 사용자가 입력한 기존에 등록되어있던 비밀번호
	 * dlvr_id 해당 계정 아이디
	 * */
	@Override
	public String pwCheck(String dlvr_id, String orgPw) throws Exception {
		String result = deliverDao.pwCheck(dlvr_id, orgPw);
		return result;
	}

	/* 배달원 비밀번호 변경 
	 * chgPw 변경할 비밀번호
	 * dlvr_id 해당 계정 아이디
	 * */
	@Override
	public String pwChange(String dlvr_id, String chgPw) throws Exception {
		String result = deliverDao.pwChange(dlvr_id, chgPw);
		return result;
	}
	
	/* 배달원 이메일 변경 
	 * chgEmail 변경할 이메일 주소
	 * dlvr_id 해당 계정 아이디
	 * */
	@Override
	public String emailChange(String dlvr_id, String chgEmail) throws Exception {
		String result = deliverDao.emailChange(dlvr_id, chgEmail);
		return result;
	}

	/* 배달원 휴대전화 번호 변경 
	 * chgPhone 변경할 휴대전화 번호
	 * dlvr_id 해당 계정 아이디
	 * */
	@Override
	public String phoneChange(String dlvr_id, String chgPhone) throws Exception {
		String result = deliverDao.phoneChange(dlvr_id, chgPhone);
		return result;
	}

	/* 배달원 주소 변경
	 * chgAddr 변경할 주소
	 * dlvr_id 해당 계정 아이디
	 *  */
	@Override
	public String addrChange(String dlvr_id, String chgAddr) throws Exception {
		String result = deliverDao.addrChange(dlvr_id, chgAddr);
		return result;
	}
	
	@Override
	public List<DeliverVo> getDlvrRank() throws Exception {
		List<DeliverVo> dlvrRank = deliverDao.getDlvrRank();
		return dlvrRank;
	}
	
	/************************************************************************/
	/*                             안드로이드                                                                   */
	/***********************************************************************/
	
	/*	안드로이드*/
	@Override
	public String modifyDeliver(DeliverVo deliverVo) throws Exception {
		String result = deliverDao.modifyDeliver(deliverVo);
		return result;
	}

	/* 신규 가입대기 배달원 */
	@Override
	public int getWaitingDeliveryCount() {
		int count = deliverDao.getWaitingDeliveryCount();
		return count;
	}

	/* 신규 배달원 */
	@Override
	public int getNewDeliveryCount() {
		int count = deliverDao.getNewDeliveryCount();
		return count;
	}

	/* 전체 배달원 */
	@Override
	public int getTotalDeliveryCount() {
		int count = deliverDao.getTotalDeliveryCount();
		return count;
	}
	
	/*----- 배달원원 리스트 -----*/
	@Override
	public List<DeliverVo> getDeliverList() {
		List<DeliverVo> list = deliverDao.getDeliverList();
		return list;
	}
	/*----- 배달원원 리스트 끝 -----*/
	
	/*----- 가입 대기 배달원원 리스트 -----*/
	@Override
	public List<DeliverVo> getWaitingDeliverList() {
		List<DeliverVo> list = deliverDao.getWaitingDeliverList();
		return list;
	}
	/*----- 가입 대기 배달원원 리스트 끝-----*/
	
	/*----- 계정상태 수정 -----*/
	
	@Override
	public String deliverStateUpdate(int dlvr_no, String dlvr_state) {
		String updateResult = deliverDao.deliverStateUpdate(dlvr_no, dlvr_state);
		return updateResult;
	}
}
