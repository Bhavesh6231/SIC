page 50102 "Item Details API"
{
    PageType = API;
    Caption = 'Item Details APiI';
    APIPublisher = 'SIC';
    APIGroup = 'item';
    APIVersion = 'v1.0';
    EntityName = 'ItemDetail';
    EntitySetName = 'ItemDetails';
    SourceTable = Item;
    DelayedInsert = true;
    
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No" ; Rec."No." )
                {
                    Caption = 'Item No.';
                    ApplicationArea = All;
                }
                field("Description"; Rec.Description)
                {
                    Caption = 'Description';
                    ApplicationArea = All;
                }
                field ("UnitofMeasure"; Rec."Base Unit of Measure")
                {
                    Caption = 'UOM';
                    ApplicationArea = All;
                }
                field("ItemCategoryCode"; Rec."Item Category Code")
                {
                    Caption ='Category';
                    ApplicationArea = All;
                }
                field("UnitPrice"; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                    ApplicationArea = All;
                }
            }
        }
    }
}