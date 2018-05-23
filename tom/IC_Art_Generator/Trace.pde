class Trace
{
  private PVector Spur[];
  PVector base_direction;
  private int trace_max_length;
  private int current_length;
  private int trace_num;
  
  
  public Trace(PVector pos, PVector base_direction, int tml, int trace_num, TraceControlGrid tcg)
  {
    this.base_direction = base_direction;
    this.trace_max_length = tml;
    Spur = new PVector[tml];
    
    for(int i = 0; i < Spur.length; i++)
    {
      Spur[i] = new PVector(pos.x, pos.y);
      tcg.setPointInTCG(int(pos.x/tcg.getDense()), int(pos.y/tcg.getDense()), trace_num);
      //println(pos.x, pos.y);
    }
    
    this.current_length = 0;
    this.trace_num = trace_num;
  }
  
  public int getTraceNumber(){ return trace_num; }
  
  void genTrace(TraceControlGrid tcg)
  {
    if(current_length == 0)
    {
      Spur[current_length+1].x -= tcg.getDense();
      current_length++;
    }
  }
  
  public void showBaseVec(TraceControlGrid tcg)
  {
    line(Spur[0].x, Spur[0].y, Spur[0].x+tcg.getDense()*base_direction.x, Spur[0].y+tcg.getDense()*base_direction.y);
    fill(200, 0, 0);
    ellipse(Spur[0].x+tcg.getDense()*base_direction.x, Spur[0].y+tcg.getDense()*base_direction.y, 10, 10);
    fill(255);
  }
  
  public void show()
  {
    for(int i = 0; i < Spur.length-1; i++)
    {
      line(Spur[i].x, Spur[i].y, Spur[i+1].x, Spur[i+1].y);
    }
  }
}
