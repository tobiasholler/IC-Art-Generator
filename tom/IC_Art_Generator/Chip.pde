class Chip
{
  //Position des Chip/Rect -> Koordianten der oberen linken Chip-Ecke
  PVector pos;
  //Array für die Kontaktpunkte mit den späteren Traces
  PVector kontaktpunkt[]; // == kp
  //width und height des Chips
  PVector chip_dim;
  //Internes Grid
  Grid grid;
  //
  PVector kp_pro_chipseite;
  Trace trace[];
  
  Chip(int x, int y, int chip_width, int chip_height, Grid grid)
  {
    this.pos = new PVector(x, y);
    this.chip_dim = new PVector(chip_width, chip_height);
    this.grid = new Grid(grid);
    
    initKP();
    initT();
  }
  
  //Init Kontaktpunkte
  void initKP()
  {
    kp_pro_chipseite = new PVector((int(chip_dim.x)/grid.getDense()-1), (int(chip_dim.y)/grid.getDense()-1));
    
    kontaktpunkt = new PVector[int(kp_pro_chipseite.x*2+kp_pro_chipseite.y*2)];
    
    for(int i = 0; i < kp_pro_chipseite.x; i++)
    {
      kontaktpunkt[i] = new PVector(pos.x+grid.getDense()*(i+1), pos.y);
    }
    
    for(int i = 0; i < kp_pro_chipseite.x; i++)
    {
      kontaktpunkt[i+int(kp_pro_chipseite.x)] = new PVector(pos.x+grid.getDense()*(i+1), pos.y+chip_dim.y);
    }
    
    for(int i = 0; i < kp_pro_chipseite.y; i++)
    {
      kontaktpunkt[i+int(kp_pro_chipseite.x)*2] = new PVector(pos.x, pos.y+grid.getDense()*(i+1));
    }
    
    for(int i = 0; i < kp_pro_chipseite.y; i++)
    {
      kontaktpunkt[i+int(kp_pro_chipseite.x*2+kp_pro_chipseite.y)] = new PVector(pos.x+chip_dim.x, pos.y+grid.getDense()*(i+1));
    }
    
    println("initKP: DONE");
  }
  
  //Initiiere die Traces/Spuren
  void initT()
  {
    this.trace = new Trace[int(kp_pro_chipseite.x*2+kp_pro_chipseite.y*2)];
    
    for(int i = 0; i < trace.length; i++)
    {
      trace[i] = new Trace(kontaktpunkt[i], 10, i, grid);
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
  void show_C(){ rect(pos.x, pos.y, chip_dim.x, chip_dim.y); }
  //Zeig mir die Kontaktpunkte
  void show_KP(){ for(PVector pv : kontaktpunkt){ ellipse(pv.x, pv.y, grid.getDense()/2, grid.getDense()/2); } }
  //Zeig mir die Traces/Spuren
  void show_T(){ for(Trace t : trace){ t.show(); } }
}
