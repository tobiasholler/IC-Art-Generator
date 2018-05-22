class Chip
{
  //Position des Chip/Rect -> Koordianten der oberen linken Chip-Ecke
  private PVector pos;
  //Array für die Kontaktpunkte mit den späteren Traces
  private PVector kontaktpunkt[]; // == kp
  //width und height des Chips
  private PVector chip_dim;
  //
  private PVector kp_pro_chipseite;
  private Trace trace[];
  //TraceControlGrid tcg;
  
  public Chip(int x, int y, int chip_width, int chip_height, Grid grid, TraceControlGrid tcg)
  {
    this.pos = new PVector(x, y);
    this.chip_dim = new PVector(chip_width, chip_height);
    
    initKP(tcg);
    initT(tcg);
  }
  
  //Init Kontaktpunkte
  public void initKP(TraceControlGrid tcg)
  {
    kp_pro_chipseite = new PVector((int(chip_dim.x)/tcg.getDense()-1), (int(chip_dim.y)/tcg.getDense()-1));
    
    kontaktpunkt = new PVector[int(kp_pro_chipseite.x*2+kp_pro_chipseite.y*2)];
    
    for(int i = 0; i < kp_pro_chipseite.x; i++)
    {
      kontaktpunkt[i] = new PVector(pos.x+tcg.getDense()*(i+1), pos.y);
      kontaktpunkt[i+int(kp_pro_chipseite.x)] = new PVector(pos.x+tcg.getDense()*(i+1), pos.y+chip_dim.y);
    }
 
    for(int i = 0; i < kp_pro_chipseite.y; i++)
    {
      kontaktpunkt[i+int(kp_pro_chipseite.x)*2] = new PVector(pos.x, pos.y+tcg.getDense()*(i+1));
      kontaktpunkt[i+int(kp_pro_chipseite.x*2+kp_pro_chipseite.y)] = new PVector(pos.x+chip_dim.x, pos.y+tcg.getDense()*(i+1));
    }
    
    println("initKP: DONE");
  }
  
  //Initiiere die Traces/Spuren
  public void initT(TraceControlGrid tcg)
  {
    this.trace = new Trace[int(kp_pro_chipseite.x*2+kp_pro_chipseite.y*2)];
    
    for(int i = 0; i < trace.length; i++)
    {
      trace[i] = new Trace(kontaktpunkt[i], 10, i, tcg);
    }
    
    println("initT: DONE");
  }
  
  //Zeig mir alles
  void show_All()
  {
    show_C();
    show_KP();
    show_T();
  }
  
  //Zeig mir den Chip
  public void show_C()
  { 
    rect(pos.x, pos.y, chip_dim.x, chip_dim.y); 
    rect(pos.x-2           , pos.y-2           , 4, 4);
    rect(pos.x-2+chip_dim.x, pos.y-2           , 4, 4);
    rect(pos.x-2           , pos.y-2+chip_dim.y, 4, 4);
    rect(pos.x-2+chip_dim.x, pos.y-2+chip_dim.y, 4, 4);
  }
  //Zeig mir die Kontaktpunkte
  public void show_KP(){ for(PVector pv : kontaktpunkt){ ellipse(pv.x, pv.y, tcg.getDense()/2, tcg.getDense()/2); } }
  //Zeig mir die Traces/Spuren
  public void show_T(){ for(Trace t : trace){ t.show(); } }
}
