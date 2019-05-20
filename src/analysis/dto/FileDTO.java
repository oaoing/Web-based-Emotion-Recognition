package analysis.dto;

public class FileDTO
{
	private String fName;
	private String emotion;
	private boolean feedback;
	
	public FileDTO() {}

	public FileDTO(String fName, String emotion, boolean feedback)
	{
		super();
		this.fName = fName;
		this.emotion = emotion;
		this.feedback = feedback;
	}

	public String getfName()
	{
		return fName;
	}

	public void setfName(String fName)
	{
		this.fName = fName;
	}

	public String getEmotion()
	{
		return emotion;
	}

	public void setEmotion(String emotion)
	{
		this.emotion = emotion;
	}

	public boolean isFeedback()
	{
		return feedback;
	}

	public void setFeedback(boolean feedback)
	{
		this.feedback = feedback;
	}
}
