/** Grapple AutoSplitter
  * made by Xarathoss
  * Version 1.0 @ 22 Aug 2017 
  */

state("Grapple")
{
    int LevelID : 0x9B33C8; //LevelID = Level + 4 (1 through 4 for menu, credits, etc)
    int EventTicker : 0xA31784, 0x268, 0xa4, 0x100, 0x128, 0xc4; //adds 1 whenever you load a new level, or load main menu
}

startup
{
settings.Add("SplitPer10", false, "Split every 10 Levels" );

}

start
{
    return current.LevelID == 5;
}

split
{
    if (settings["SplitPer10"])
        {
        return (current.EventTicker != old.EventTicker) && current.LevelID % 10 == 4;
        }
    else
        {
        return current.EventTicker != old.EventTicker && current.LevelID > 4;
        }
}

reset
{
    return current.LevelID == 2;
}
