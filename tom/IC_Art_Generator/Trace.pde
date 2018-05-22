class Trace
{
  //PVector Pos;
  private PVector Spur[];
  //PVector Base_Direction;
  //Oben  :  0,  1
  //Unten :  0, -1
  //Links : -1,  0
  //Rechts:  1,  0
  private int trace_max_length;
  private int current_length;
  private int trace_num;
  
  
  public Trace(PVector pos, int tml, int trace_num, TraceControlGrid tcg)
  {
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
  
  void genTrace()
  {
  }
  
  public void show()
  {
    for(int i = 0; i < Spur.length-1; i++)
    {
      line(Spur[i].x, Spur[i].y, Spur[i+1].x, Spur[i+1].y);
    }
  }
}
