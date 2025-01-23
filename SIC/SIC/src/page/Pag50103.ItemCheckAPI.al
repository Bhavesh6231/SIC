page 50103 "Item Check API"
{
    PageType = API;
    Caption = 'apiPageName';
    APIPublisher = 'SIC';
    APIGroup = 'groupName';
    APIVersion = 'v1.0';
    EntityName = 'ItemCheck';
    EntitySetName = 'ItemCheck';
    SourceTable = "Item Ledger Entry";
    DelayedInsert = true;
    
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                // field(fieldName; NameSource)
                // {
                //     Caption = 'fieldCaption';
                    
                // }
            }
        }
    }
}