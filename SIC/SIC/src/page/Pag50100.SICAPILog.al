page 50100 "SIC API Log"
{
    PageType = Worksheet;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "SIC API Log";
    Editable = false;
    
    layout
    {
        area(Content)
        {
            repeater(Groupname)
            {
                ShowAsTree = true;
                IndentationColumn = Rec.Indentation;
                TreeInitialState = ExpandAll;
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Created At"; Rec."Created At")
                {
                    ApplicationArea = All;
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                }
                field("End Point"; Rec."End Point")
                {
                    ApplicationArea = All;
                }
                field("Reference No."; Rec."Reference No.")
                {
                    ApplicationArea = All;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }
                field("Batch ID"; Rec."Batch ID")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Download JSON")
            {
                ApplicationArea = All;
                Caption = 'Download JSON';
                Image = Export;
                trigger OnAction()
                var
                    ExportJson : Codeunit "SIC JSON Download";
                begin
                    ExportJson.ExportSICAPILogAsJson(Rec);
                end;
            }
            action("View Response")
            {
                ApplicationArea = All;
                Caption = 'View Response (Filtered View)';
                Image = View;

                trigger OnAction()
                var
                    LogRecord : Record "SIC API Log";
                    ResponseText : Text;
                begin
                      if Rec.Type = Rec.Type::"Request Line" then begin
                        
                            LogRecord.SetRange("Reference No.",Rec."Reference No.");
                            LogRecord.SetRange(Type,LogRecord.Type::"Response Line");
                            if LogRecord.FindFirst() then begin
                               Message('Response found for Request #%1: %2', Rec."Reference No.", LogRecord."End Point");
                            end
                            else
                                Message('No response found for the selected request.');
                      end    
                       
                      else
                        Message('Please select a request line to view the response.');
                      
                end;
            }
        }
    }
    
    var
        myInt: Integer;
}
