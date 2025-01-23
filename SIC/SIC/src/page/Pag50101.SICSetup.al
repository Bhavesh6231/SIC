page 50101 "SIC Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "SIC Setup";
    
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(MyField; Rec.MyField)
                {
                    
                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }
    
    var
        myInt: Integer;
}