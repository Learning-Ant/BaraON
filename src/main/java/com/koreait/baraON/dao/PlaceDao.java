package com.koreait.baraON.dao;

import java.util.List;

import com.koreait.baraON.dto.PlaceCategoryDto;
import com.koreait.baraON.dto.PlaceDto;
import com.koreait.baraON.dto.PlaceListDto;
import com.koreait.baraON.dto.PlaceOptionDto;
import com.koreait.baraON.dto.ReviewDto;
import com.koreait.baraON.dto.SellerDto;

public interface PlaceDao {

	public List<PlaceListDto> placeList();
	public PlaceDto getPlaceDto(int p_no);
	public String getPcName(int pc_no);
	public SellerDto getSellerDto(int s_no);
	public List<ReviewDto> getReviewList(int p_no, int beginRecord, int endRecord);
	public List<PlaceOptionDto> getPlaceOptionList(int p_no);
	public List<PlaceListDto> getPlaceDtoList(int s_no);
}
