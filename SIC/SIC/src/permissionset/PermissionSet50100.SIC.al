permissionset 50100 SIC
{
    Assignable = true;
    Permissions = 
        tabledata "SIC API Log" = RMID,
        tabledata "SIC Setup" = RMID,
        
        table "SIC API Log" = X,
        table "SIC Setup" = X,

        page "SIC Setup" = X,
        page "SIC API Log" = X,
        page "Item Details API" = X;
        
} 