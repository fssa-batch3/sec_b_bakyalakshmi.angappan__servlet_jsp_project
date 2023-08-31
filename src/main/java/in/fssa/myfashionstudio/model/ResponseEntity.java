package in.fssa.myfashionstudio.model;

public class ResponseEntity {

	private int statusCode;
	private Object data;
	private String message;

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "ResponseEntity [statusCode=" + statusCode + ", data=" + data + ", message=" + message + "]";
	}

}
