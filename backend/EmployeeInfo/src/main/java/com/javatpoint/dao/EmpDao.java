package com.javatpoint.dao;  
import java.sql.ResultSet;  
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;  
import org.springframework.jdbc.core.BeanPropertyRowMapper;  
import org.springframework.jdbc.core.JdbcTemplate;  
import org.springframework.jdbc.core.RowMapper;  
import com.javatpoint.beans.Emp;
  
/**
 * 作成者 : エエティン
 * クラス名 : EmpDao 
 * 概要 　　: 社員情報 DAO
 * 作成日　:　2021/08/02
 */

public class EmpDao {  
JdbcTemplate template;  
  
public void setTemplate(JdbcTemplate template) {  
    this.template = template;  
}  

SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd"); 

/**
 * EmployeeテーブルにInsert文
 * @param p  社員情報モデル
 * @throws ParseException 
 */
public int saveEmployee(Emp p) throws ParseException{  
	p.setBirthday(stringToDate(p.getBirthday_year(),p.getBirthday_month(),p.getBirthday_date()));
	p.setJoined_day(stringToDate(p.getJoined_day_year(),p.getJoined_day_month(),p.getJoined_day_date()));
    String sql="insert into employee(id,name,age,gender,birthday,tel,address,category,joined_day,admin_auth) values('"
              + p.getId()+"','"
    		  + p.getName()+"','"
              + p.getAge()+"','"
    		  + p.getGender()+"','"
    		  + sdf.format(p.getBirthday())+"','"
    		  + p.getTel()+"','"
    	      + p.getAddress()+"','" 
    	      + p.getCategory()+"','"
    	      + sdf.format(p.getJoined_day())+"','" 
    	      + p.getAdmin_auth()+"')";  
    return template.update(sql); 
}  

/**
 * UseLoginテーブルにInsert文
 * @param p  社員情報モデル
 */
public int saveUser(Emp p){  
    String sql="insert into uselogin(id,password) values('"
              +p.getId()+"',"
    	      +p.getPassword()+")";  
    return template.update(sql); 
}  

/**
 * ユーザー情報テーブルの更新文
 * @param p 
 * @return
 */
public int userInfoUpdate(Emp p){  
    String sql="update uselogin set password='"+p.getPassword()+"' where id="+p.getId()+"";  
    return template.update(sql);  
}  

/**
 * 社員情報テーブルのSQL 更新文
 * @param id 更新ID
 * @throws ParseException 
 * 
 */
public int update(Emp p) throws ParseException{  
	p.setBirthday(stringToDate(p.getBirthday_year(),p.getBirthday_month(),p.getBirthday_date()));
	p.setJoined_day(stringToDate(p.getJoined_day_year(),p.getJoined_day_month(),p.getJoined_day_date()));
    String sql="update employee set "
    		+ "name='"+p.getName()
    		+"', age="+p.getAge()
    		+",gender='"+p.getGender()
    		+"',birthday='"+sdf.format(p.getBirthday())
    		+"',tel='"+p.getTel()
    		+"',address='"+p.getAddress()
    		+"',category='"+p.getCategory()
    		+"',joined_day='"+sdf.format(p.getJoined_day())
    		+"',admin_auth="+p.getAdmin_auth()
    		+" where id="+p.getId()+"";  
    return template.update(sql);  
}  

/**
 * SQL 削除文
 * @param id 削除ID
 * 
 */
public int delete(int id){  
    String sql="delete from employee where id="+id+"";  
    return template.update(sql);  
}

/**
 * SQL 削除文
 * @param id 削除ID
 * 
 */
public int deleteUser(int id){  
    String sql="delete from uselogin where id="+id+"";  
    return template.update(sql);  
} 

/**
 * データベース(UseLoginテーブル)情報を取得する
 * @param p　社員情報モデル
 * @return　boolean レコードが存在しているかどうかのフラグ
 */
public boolean userLogin(Emp p){
	 String sql="select count(*) from uselogin where id= ? and password=?"; 
	 int count=  template.queryForObject(sql, new Object[]{p.getId(),p.getPassword()},Integer.class); 
	 return count > 0 ;
} 

/**
 *  社員情報テーブルのSQL SELECT文
 * @return
 */
public List<Emp> getEmployees(){
    return template.query("select * from employee",new RowMapper<Emp>(){
    	@SuppressWarnings("deprecation")
		public Emp mapRow(ResultSet rs, int row) throws SQLException {  
            Emp e=new Emp();  
            e.setId(rs.getInt(1));  
            e.setName(rs.getString(2));  
            e.setAge(rs.getInt(3));  
            e.setGender(rs.getInt(4));  
            e.setBirthday(rs.getDate(5));
            e.setBirthday_year(Integer.toString(rs.getDate(5).getYear()+1900));
            e.setBirthday_month(Integer.toString(rs.getDate(5).getMonth()+1));
            e.setBirthday_date(Integer.toString(rs.getDate(5).getDate()));
            e.setTel(rs.getString(6));
            e.setAddress(rs.getString(7));
            e.setCategory(rs.getString(8));
            e.setJoined_day(rs.getDate(9));
            e.setJoined_day_year(Integer.toString(rs.getDate(9).getYear()+1900));
            e.setJoined_day_month(Integer.toString(rs.getDate(9).getMonth()+1));
            e.setJoined_day_date(Integer.toString(rs.getDate(9).getDate()));
            e.setAdmin_auth(rs.getInt(10));
            return e;  
        }  
    });  
}

/**
 * 社員情報テーブルのSQL SELECT文
 * @param id 社員ID
 * @return　取得した情報
 */
public Emp getEmpById(int id){  
    String sql="select * from employee where id=?";  
    return template.queryForObject(sql, new Object[]{id},new BeanPropertyRowMapper<Emp>()  {
            @SuppressWarnings("deprecation")
			public Emp mapRow(ResultSet rs, int row) throws SQLException {  
        Emp e=new Emp();  
        e.setId(rs.getInt(1));  
        e.setName(rs.getString(2));  
        e.setAge(rs.getInt(3));  
        e.setGender(rs.getInt(4));  
        e.setBirthday(rs.getDate(5));
        e.setBirthday_year(Integer.toString(rs.getDate(5).getYear()+1900));
        e.setBirthday_month(Integer.toString(rs.getDate(5).getMonth()+1));
        e.setBirthday_date(Integer.toString(rs.getDate(5).getDate()));
        e.setTel(rs.getString(6));
        e.setAddress(rs.getString(7));
        e.setCategory(rs.getString(8));
        e.setJoined_day(rs.getDate(9));
        e.setJoined_day_year(Integer.toString(rs.getDate(9).getYear()+1900));
        e.setJoined_day_month(Integer.toString(rs.getDate(9).getMonth()+1));
        e.setJoined_day_date(Integer.toString(rs.getDate(9).getDate()));
        e.setAdmin_auth(rs.getInt(10));
        return e;  
    }  
    }
);  
}

/**
 * UseLoginテーブルのSQL SELECT文
 * @param id ユーザーID
 * @return
 */
public String getUserPassword(int id){  
    String sql="select password from uselogin where id=?";  
    return template.queryForObject(sql, new Object[]{id},String.class);  
}

Date stringToDate(String year,String month, String day) throws ParseException {
	String date_string = year+"/"+month+"/"+day;
	Date date = sdf.parse(date_string);    
	return date;
}
}  