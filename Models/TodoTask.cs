namespace TodoApi.Models;

public class TodoTask{
  public long Id {get;set;}
  public string? Name{get;set;}
  public string? Secret{get;set;}
  public bool IsActive{get;set;}
}
