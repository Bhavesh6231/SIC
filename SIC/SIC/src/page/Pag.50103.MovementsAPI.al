page 50104 "Movements API"
{
    PageType = API;
    Caption = 'apiPageName';
    APIPublisher = 'publisherName';
    APIGroup = 'groupName';
    APIVersion = 'v1.0';
    EntityName = 'Movements';
    EntitySetName = 'Movements';
    SourceTable = "Item Ledger Entry";
    DelayedInsert = true;
    
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                // field(No; NameSource)
                // {
                //     Caption = 'fieldCaption';
                    
                // }
            }
        }
    }
}