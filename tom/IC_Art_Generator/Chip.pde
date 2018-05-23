class Chip
{
  //Position des Chip/Rect -> Koordianten der oberen linken Chip-Ecke
  private PVector pos;
  //Array für die Kontaktpunkte mit den späteren Traces
  private PVector kontaktpunkt[]; // == kp
  //width und height des Chips
  private PVector chip_dim;
  private PVector kp_pro_chipseite;
  private Trace trace[];
  private PVector base_direction[];
  
  public Chip(int x, int y, int chip_width, int chip_height, TraceControlGrid tcg)
  {
    this.pos = new PVector(x, y);
    this.chip_dim = new PVector(chip_width, chip_height);
    this.base_direction = new PVector[5];
    //oben
    base_direction[0] = new PVector(0, -1);
    //unten
    base_direction[1] = new PVector(0, 1);
    //links
    base_direction[2] = new PVector(-1, 0);
    //rechts
    base_direction[3] = new PVector(1, 0);
    //"default" -> in case something goes wrong
    base_direction[4] = new PVector(0, 0);
    
    //Update tcg
    for(int i = 0; i <= chip_width/tcg.getDense(); i++)
    {
      for(int j = 0; j <= chip_height/tcg.getDense(); j++)
      {
        tcg.setPointInTCG(x/tcg.getDense()+i, y/tcg.getDense()+j, -2);
      }
    }
    
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
      //oben
      if(i >= 0 && i < kp_pro_chipseite.x)
      {
        trace[i] = new Trace(kontaktpunkt[i], base_direction[0], 10, i, tcg);
      }
      //unten
      else if(i >= kp_pro_chipseite.x && i < kp_pro_chipseite.x*2)
      {
        trace[i] = new Trace(kontaktpunkt[i], base_direction[1], 10, i, tcg);
      }
      //links
      else if(i >= kp_pro_chipseite.x*2 && i < kp_pro_chipseite.x*2+kp_pro_chipseite.y)
      {
        trace[i] = new Trace(kontaktpunkt[i], base_direction[2], 10, i, tcg);
      }
      //rechts
      else if(i >= (kp_pro_chipseite.x*2+kp_pro_chipseite.y) && i < kp_pro_chipseite.x*2+kp_pro_chipseite.y*2)
      {
        trace[i] = new Trace(kontaktpunkt[i], base_direction[3], 10, i, tcg);
      }
      else
      {
        trace[i] = new Trace(kontaktpunkt[i], base_direction[4], 10, i, tcg);
      }
      
    }
    
    println("initT: DONE");
  }
  
  public void genTrace(TraceControlGrid tcg)
  {
    for(int i = 0; i < trace.length; i++)
    {
      trace[i].genTrace(tcg);
    }
  }
  
  //Zeig mir alles
  public void show_All(TraceControlGrid tcg)
  {
    show_C();
    show_KP();
    show_T(tcg);
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
  public void show_T(TraceControlGrid tcg)
  {
    for(Trace t : trace)
    {
      t.show();
      t.showBaseVec(tcg);
    }
  }
}
