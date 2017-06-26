package org.dclab.mapping;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.dclab.model.Model;

public interface ModelMapperI {
	@Select("SELECT * FROM `element` WHERE bigClass=#{bigClass} AND middleClass=#{middleClass} AND smallClass=#{smallClass} AND state=1")
	public List<Model> getElementByClass(@Param(value="bigClass")int bigClass,@Param(value="middleClass")int middleClass,@Param(value="smallClass")int smallClass);
	
	@Select("SELECT url FROM element,SDMfile WHERE elementID=#{elementID} AND element.fileID = SDMfile.fileID")
	public String getUrlByElementID(int elementID);
	
	@Insert("INSERT INTO `element`(EnglishName,ChineseName,description,fileID,smallClass,middleClass,bigClass,creator,createTime,state) VALUES (#{EnglishName},#{ChineseName},#{description},#{fileID},#{smallClass},#{middleClass},#{bigClass},#{creator},#{createTime},#{state})")
	public int insertModel(Model model);
	
	@Select("SELECT * FROM element WHERE creator=#{username}")
	public List<Model> getModelByUserID(String username);
	
	@Select("SELECT * FROM element WHERE bigClass=#{classID} AND state=0")
	public List<Model> getModelByBigClass(int classID);
	
	@Select("SELECT * FROM element WHERE elementID=#{elementID}")
	public Model getModelByEleID(int elementID);
	
	@Update("UPDATE element SET state=#{state} where elementID=#{elementID}")
	public int updateState(@Param(value="elementID")int elementID,@Param(value="state")int state);
}

