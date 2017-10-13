package com.gs.spider.dao;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.gs.spider.model.User;
import com.gs.spider.utils.SysUtil;

@Service("UserDao")
public class UserDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

/*	public List<User> searchAll() {  
		List<User> userlist=new ArrayList<User>();  
        String sql="select * from data";  
        userlist=jdbcTemplate.query(sql, new RowMapper<User>(){  
            public User mapRow(ResultSet rs, int index) throws SQLException {         
                        User user=new User();  
                        user.setId(rs.getString("id"));  
                        user.setTitle(rs.getString("title"));  
                        user.setContent(rs.getString("content"));  
                        return user;  
            }     
        });  
        return userlist;
    }*/
	
	public void save(User user) {  
        jdbcTemplate.update("INSERT INTO ATT_TEMPORARY_DATA (DATA_ID,TITLE,RELEASE_DATE,RELEASE_PERSON,TEMP_SOURCE,"
        		+ "TEMP_CONTENT,TEMP_TYPE,TEMP_KEYWORD,STATUS,IMG_PATH,SOURCE_URL,CATAGORY) VALUES('"
        		+ SysUtil.getSerialNo()+ "', '" 
        		+ user.getTitle() + "', '"  
        		+ user.getReleaseDate()+ "', '" 
        		+ user.getReleasePerson()+ "', '" 
        		+ user.getTempSource() + "', '"
				+ user.getTempContent() + "', '"
				+ user.getTempType() + "', '"
				+ user.getTempKeyword() + "', '"
				+ user.getStatus() + "', '"
				+ user.getImgPath() + "', '"
				+ user.getSourceUrl() + "', '"
				+ user.getCatagory() + "')");  
    }
	
}
