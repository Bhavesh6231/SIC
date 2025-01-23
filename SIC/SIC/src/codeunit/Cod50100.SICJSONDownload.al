codeunit 50100 "SIC JSON Download"
{
    procedure ExportSICAPILogAsJson(LogRecord : Record "SIC API Log")
    var
        TempBlob : Codeunit "Temp Blob";
        JsonObject : JsonObject; 
        JsonOutstream : OutStream;
        JsonInstream : InStream;
        JsonFile : Text;
    begin
        JsonObject.Add('EntryNo.', LogRecord."Entry No.");
        JsonObject.Add('CreatedAt',LogRecord."Created At");
        #pragma warning disable 
        JsonObject.Add('Type',LogRecord.Type);
        JsonObject.Add('ReferenceNo.',LogRecord."Reference No.");
        JsonObject.Add('BatchId',LogRecord."Batch ID");

        TempBlob.CreateOutStream(JsonOutstream);
            JsonFile := 'SIC API Log.json'; 
        if JsonObject.WriteTo(JsonOutstream) then begin
            TempBlob.CreateInStream(JsonInstream);
            DownloadFromStream(JsonInstream,'','','',JsonFile);
        end;
    end;
    trigger OnRun()
    begin
        
    end;
    var
        myInt: Integer;
}