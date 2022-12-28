package vo;

public class Member {
	private String memberId;
	private String memberPw;
	private String memberPw2;
	private String memberName;
	private String updatedate;
	private String createdate;
	
	public Member() {}
	
	
	public Member(String memberId, String memberPw, String memberPw2, String memberName, String updatedate,
			String createdate) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberPw2 = memberPw2;
		this.memberName = memberName;
		this.updatedate = updatedate;
		this.createdate = createdate;
	}


	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberPw2() {
		return memberPw2;
	}

	public void setMemberPw2(String memberPw2) {
		this.memberPw2 = memberPw2;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	
	
	
}
