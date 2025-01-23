table 50100 "SIC API Log"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Entry No."; BigInteger)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "Created At"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(3; Type; Enum Type)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "End Point"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Reference No."; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Created By"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Indentation; Integer)
        {
            DataClassification = ToBeClassified;
            Description = '0 = Request Line, 1 = Response Line';
        }
        field(8; "Batch ID"; BigInteger)
        {
            DataClassification = ToBeClassified;
            //AutoIncrement = true;
            Description = 'Batch ID will be same for Request and Response lines';
        }
    }
    
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
    
    fieldgroups
    {
        // Add changes to field groups here
    }
    
    var
        myInt: Integer;
    
    trigger OnInsert()
    var
        SICAPILog: Record "SIC API Log";
    begin
        if (Indentation = 0) then begin
            "Batch ID" := GetNextBatchID()
        end
        else begin
            SICAPILog.SetRange("Reference No.","Reference No.");
            SICAPILog.SetRange(Indentation,0);

            if SICAPILog.FindFirst() then begin
                "Batch ID" := SICAPILog."Batch ID";
            end
            else 
                Message('No matching request found for the give Reference No.');
        end;
    end;
    
    local procedure GetNextBatchID() : BigInteger
    var
        MaxBatchID : BigInteger;
        SCIAPILog : Record "SIC API Log";
    begin
        if SCIAPILog.FindLast then 
            MaxBatchID := SCIAPILog."Batch ID"
        else 
            MaxBatchID := 0;

        exit(MaxBatchID+1);
    end;
}

