package org.dclab.service;

import java.util.List;

import org.apache.zookeeper.CreateMode;
import org.apache.zookeeper.WatchedEvent;
import org.apache.zookeeper.Watcher;
import org.apache.zookeeper.ZooDefs.Ids;
import org.apache.zookeeper.ZooKeeper;
import org.dclab.mapping.ModelMapperI;
import org.dclab.mapping.UserMapperI;
import org.dclab.model.Model;
import org.dclab.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.dclab.zk.*;


@Service
public class ModelService {
	@Autowired
	private ModelMapperI modelMapperI;
	@Autowired
	private UserMapperI userMapperI;
//	@Autowired
//	private ZooKeeperService zooKeeperService;
	public static int CLIENT_PORT = 2181;
	public static int TIME_OUT    = 2000;

	public void setModelMapperI(ModelMapperI modelMapperI) {
		this.modelMapperI = modelMapperI;
	}
    public List<Model> checkModel(int bigClass,int middleClass,int smallClass){
    	return modelMapperI.getElementByClass(bigClass, middleClass, smallClass);
    }
    
    public String downloadModel(int elementID){
    	return modelMapperI.getUrlByElementID(elementID);
    }

    public int createModel(Model model) throws Exception{
    	if(modelMapperI.insertModel(model)==1){	
    		//zooKeeperService.zookeeperWatch(model);
    		//zookeeper(model);
    		//ZkDemo.hello();
    		List<User> users=userMapperI.getUserByAuthority(model.getBigClass());
			ZooKeeperService zookeeper=new ZooKeeperService();
			return zookeeper.zookeeperWatch(model,users);
    	}
		else {
			return -1;
		}
    }
}
