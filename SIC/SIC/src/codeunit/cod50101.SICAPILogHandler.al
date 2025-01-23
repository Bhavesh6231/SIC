codeunit 50101 "SIC API Log Handler"
{
    Subtype = Normal;
    procedure CreateLogEntry(EndPoint : Text[50]; ReferenceNo : Text[50]; CreatedBy : Text[50]; IsRequest : Boolean)
    var
        SICAPILog: Record "SIC API Log";
        BatchID: BigInteger;
    begin
        if IsRequest then begin
            SICAPILog.Init();
            SICAPILog."Created At" := CurrentDateTime();
            SICAPILog.Type := SICAPILog.Type::"Request Line";
            SICAPILog."End Point" := EndPoint;
            SICAPILog."Reference No." := ReferenceNo;
            SICAPILog."Created By" := CreatedBy;
            SICAPILog.Indentation := 0; 
            SICAPILog."Batch ID" := GetNextBatchID();
            SICAPILog.Insert();
        end 
        else begin
            if FindRequestLog(ReferenceNo, BatchID) then begin
                SICAPILog.Init();
                SICAPILog."Created At" := CurrentDateTime();
                SICAPILog.Type := SICAPILog.Type::"Response Line";
                SICAPILog."End Point" := EndPoint;
                SICAPILog."Reference No." := ReferenceNo;
                SICAPILog."Created By" := CreatedBy;
                SICAPILog.Indentation := 1; 
                SICAPILog."Batch ID" := BatchID;
                SICAPILog.Insert();
                end 
            else begin
                Error('No matching request found for the given Reference No.');
            end;
        end;
    end;
    local procedure GetNextBatchID(): BigInteger
    var
        MaxBatchID: BigInteger;
        SICAPILog: Record "SIC API Log";
    begin
        if SICAPILog.FindLast then
            MaxBatchID := SICAPILog."Batch ID"
        else
            MaxBatchID := 0;
        exit(MaxBatchID + 1);
    end;

    local procedure FindRequestLog(ReferenceNo: Text[50]; var BatchID: BigInteger): Boolean
    var
        SICAPILog: Record "SIC API Log";
    begin
        SICAPILog.SetRange("Reference No.", ReferenceNo);
        SICAPILog.SetRange(Indentation, 0); 
        if SICAPILog.FindFirst() then begin
            BatchID := SICAPILog."Batch ID";
            exit(true);
        end else
            exit(false);
    end;
    trigger OnRun()
    begin
        
    end;
    
    var
        myInt: Integer;
}