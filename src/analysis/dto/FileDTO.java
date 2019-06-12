package analysis.dto;

public class FileDTO
{
	private String saveDir;
	private boolean feedback;
	private String emotion;
	
	public FileDTO() {}

	public FileDTO(String saveDir, boolean feedback, String emotion)
	{
		super();
		this.saveDir = saveDir;
		this.feedback = feedback;
		this.emotion = emotion;
	}

	public String getSaveDir()
	{
		return saveDir;
	}

	public void setSaveDir(String saveDir)
	{
		this.saveDir = saveDir;
	}

	public boolean isFeedback()
	{
		return feedback;
	}

	public void setFeedback(boolean feedback)
	{
		this.feedback = feedback;
	}

	public String getEmotion()
	{
		return emotion;
	}

	public void setEmotion(String emotion)
	{
		this.emotion = emotion;
	}

}