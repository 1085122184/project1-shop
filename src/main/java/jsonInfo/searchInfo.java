package jsonInfo;

public class searchInfo {
	int max=3;
	 Integer pageno=1;
	String where="";
	String limit=" limit "+(pageno-1)*max+","+max;
	 public Integer getNext() {
			return pageno+1;
		}
	   public Integer getPrev() {
			return pageno>1?pageno-1:1;
		}
	
	   public Integer getPageno() {
			return pageno;
		}
		public void setPageno(int pageno) {
			if(pageno<1)
				 pageno=1;
			this.pageno = pageno;
			limit =" limit "+(pageno-1)*max+","+max;
			
		}
		public void can(boolean b) {
			limit="";
		}

	public String getWhere() {
		return where;
	}
	public void setWhere(String where) {
		this.where = where;
	}
	public String getLimit() {
		return limit;
	}
	public void setLimit(String limit) {
		this.limit = limit;
	}
	
}
